const oneDay = 1000 * 60 * 60 * 24;
const cookieParser = require("cookie-parser");
const sessions = require('express-session');
const express = require('express');
// const bodyParser = require('body-parser');
const mysql = require('mysql2');
const app = express();

// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('css'));
app.use(express.static('assets'));
app.use(express.static('html'));
app.use(express.static('js'));
app.use(sessions({
  secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
  saveUninitialized: true,
  cookie: { maxAge: oneDay },
  resave: false
}));
app.use(cookieParser());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const connection = mysql.createConnection({
  host: '127.0.0.1',
  // user: 'root',
  // password: 'root',
  user: 'adm',
  password: 'adm',
  database: 'kampech'
});

connection.connect(function (err) {
  console.log("Conexão como o Banco realizada com sucesso!!!")
});

let session;

app.get('/', (req, res) => {
  session = req.session;
  if (session.id_user) {
    res.send("Welcome User <a href=\'/logout'>click to logout</a>");
  } else
    res.sendFile('views/index.html', { root: __dirname })
});

app.post('/login', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;

  connection.query(`SELECT * FROM kp_user where email = '${email}'`, function (err, rows, fields) {
    if (!err) {
      console.log("Resultado:", rows);

      if (rows.length === 0) {
        res.redirect('/login.html?404account');
      } else {
        if (password === rows[0].password) {
          session = req.session;
          session.id_user = req.body.email;
          console.log(req.session)
          res.redirect('/personalInfo.html');
        }
        else {
          res.redirect('/login.html?passwordError');
        }
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
    }
  });
});

app.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/');
});

app.get('/getPersonalInfo', (req, res) => {
  // Verificar se o usuário está autenticado
  if (!req.session.id_user) {
    res.status(401).json({ error: 'Usuário não autenticado' });
    return;
  }

  // Obter as informações pessoais do usuário no banco de dados
  const email = req.session.id_user;

  connection.query(`SELECT kp_user.*, kp_address.* FROM kp_user
    LEFT JOIN kp_address ON kp_user.id_user = kp_address.id_user
    WHERE kp_user.email = '${email}'`, (err, rows, fields) => {
    if (!err) {
      if (rows.length === 0) {
        res.status(404).json({ error: 'Usuário não encontrado' });
      } else {
        // Enviar as informações pessoais do usuário como resposta JSON
        const personalInfo = {
          name: rows[0].name,
          address: rows[0].address,
          cpf: rows[0].cpf,
          zip_code: rows[0].zip_code,
          city: rows[0].city,
          state: rows[0].state,
          phone: rows[0].phone
        };
        res.json(personalInfo);
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});

app.post('/register', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;
  let name = req.body.name;

  connection.query(`INSERT INTO \`kp_user\` (\`id_user\`, \`name\`, \`email\`, \`password\`, \`cpf\`, \`phone\`) 
  VALUES (NULL, '${name}', '${email}', '${password}', NULL, NULL)`, function (err, rows, fields) {
    if (!err) {
      console.log("Usuário cadastrado com sucesso!");
      res.redirect('/personalInfo.html');
    } else {
      console.log("Erro: Consulta não realizada", err);
    }
  });
});

app.post('/custom', (req, res) => {
  const customKeyboard = {
    size: req.body.size,
    connection: req.body.connection,
    switch: req.body.switch,
    keycap: req.body.keycap,
    boardColor: req.body.boardColor,
    keyColor: req.body.keyColor,
    description: `Teclado Custom: Size: ${req.body.size}; Connection: ${req.body.connection}; Switch: ${req.body.switch}; Keycap: ${req.body.keycap}; Board color: ${req.body.boardColor}; Key color: ${req.body.keyColor}`
  };
  if (!req.session.id_user) {
    res.redirect('/custom.html?noLogin')
  } else {
    connection.query(`INSERT INTO \`kp_user_products\` (\`id_user_products\`, \`id_user\`, \`id_product\`) 
    VALUES (NULL, (SELECT \`id_user\` FROM \`kp_user\` WHERE \`email\` = '${req.session.id_user}'), (SELECT \`id_product\` FROM \`kp_product\` WHERE
    \`size\` = '${customKeyboard.size}' AND \`connection\` = '${customKeyboard.connection}' AND
    \`switch\` = '${customKeyboard.switch}' AND \`main_color\` = '${customKeyboard.boardColor}' AND
    \`key_color\` = '${customKeyboard.keyColor}' LIMIT 1));`, (err, rows, fields) => {
      if (!err) {
        if (customKeyboard.keycap != '') {
        connection.query(`INSERT INTO \`kp_user_products\` (\`id_user_products\`, \`id_user\`, \`id_product\`) 
        VALUES (NULL, (SELECT \`id_user\` FROM \`kp_user\` WHERE \`email\` = '${req.session.id_user}'), (SELECT \`id_product\` FROM \`kp_product\`
        WHERE \`name\` = '${customKeyboard.keycap}' LIMIT 1));`, (err, rows, fields) => {
          if (!err) {
            console.log('Keycap adicionado ao carrinho!');
          } else {
            console.log("Erro: keycap não adicionada!", err);
            res.status(500).json({ error: 'Erro no servidor' });
          }
        });
      }
        console.log('Teclado adicionado ao carrinho!');
        res.redirect('/index.html');
      } else {
        console.log("Erro: teclado não adicionado!", err);
        res.status(500).json({ error: 'Erro no servidor' });
      }
    });
  }
});

app.get('/getCartItems', (req, res) => {
  // Verificar se o usuário está autenticado
  if (!req.session.id_user) {
    res.status(401).json({ error: 'Usuário não autenticado' });
    return;
  }

  // Obter os itens do carrinho do usuário no banco de dados
  const email = req.session.id_user;

  connection.query(`SELECT kp_product.name, kp_product.description, kp_product.price FROM kp_product
    INNER JOIN kp_user_products ON kp_product.id_product = kp_user_products.id_product
    INNER JOIN kp_user ON kp_user_products.id_user = kp_user.id_user
    WHERE kp_user.email = '${email}'`, (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});

app.listen(3700, () => {
  console.log('Servidor rodando na porta 3700!')
});