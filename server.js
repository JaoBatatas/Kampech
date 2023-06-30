const oneDay = 1000 * 60 * 60 * 24;
const cookieParser = require("cookie-parser");
const sessions = require('express-session');
const express = require('express');
const mysql = require('mysql2');
const app = express();
const cors = require('cors');
app.use(cors());
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
app.use((req, res, next) => {
  //Qual site tem permissão de realizar a conexão, no exemplo abaixo está o "*" indicando que qualquer site pode fazer a conexão
  res.header("Access-Control-Allow-Origin", "*");
  //Quais são os métodos que a conexão pode realizar na API
  res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
  next();
});

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  // user: 'adm',
  // password: 'adm',
  database: 'kampech'
});

connection.connect(function (err) {
  console.log("Conexão como o Banco realizada com sucesso!!!")
});

app.post('/register', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;
  let name = req.body.name;
  connection.query('INSERT INTO `kp_user` (`id_user`, `name`, `email`, `password`, `cpf`, `phone`) VALUES (NULL, ?, ?, ?, NULL, NULL)', [name, email, password], function (err, rows, fields) {
    if (!err) {
      // console.log("Usuário cadastrado com sucesso!");
      req.session.id_user = email; // ID do usuário inserido no banco de dados
      // console.log(req.session.id_user);
      res.redirect('/personalInfo.html');
    } else {
      console.log("Erro: Consulta não realizada", err);
    }
  });
});
app.post('/login', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;

  connection.query(`SELECT * FROM kp_user where email = '${email}'`, function (err, rows, fields) {
    if (!err) {
      // console.log("Resultado:", rows);

      if (rows.length === 0) {
        res.redirect('/login.html?404account');
      } else {
        if (password === rows[0].password) {
          session = req.session;
          session.id_user = req.body.email;
          // console.log(req.session)
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
app.post('/sendPersonalInfo', (req, res) => {
  // Verificar se o usuário está autenticado
  if (!req.session.id_user) {
    res.status(401).json({ error: 'Usuário não autenticado' });
    return;
  }
  // Obter as informações pessoais do corpo da solicitação
  const personalInfo = req.body;
  // Atualizar as informações pessoais do usuário no banco de dados
  const email = req.session.id_user;
  const userQuery = `UPDATE kp_user
                     SET name = '${personalInfo.name}', cpf = '${personalInfo.cpf}', phone = '${personalInfo.phone}'
                     WHERE email = '${email}'`;
  const addressQuery = `UPDATE kp_address
                        SET address = '${personalInfo.address}', zip_code = '${personalInfo.zip_code}', city = '${personalInfo.city}', state = '${personalInfo.state}'
                        WHERE id_user IN (SELECT id_user FROM kp_user WHERE email = '${email}')`;
  connection.query(userQuery, (userErr, userResult) => {
    if (userErr) {
      console.log("Erro: Atualização do usuário não realizada", userErr);
      res.status(500).json({ error: 'Erro no servidor' });
      return;
    }
    if (userResult.affectedRows === 0) {
      res.status(404).json({ error: 'Usuário não encontrado' });
      return;
    }
    connection.query(addressQuery, (addressErr, addressResult) => {
      if (addressErr) {
        console.log("Erro: Atualização do endereço não realizada", addressErr);
        res.status(500).json({ error: 'Erro no servidor' });
        return;
      }
      if (addressResult.affectedRows === 0) {
        res.status(404).json({ error: 'Endereço não encontrado' });
        return;
      }
      res.json({ message: 'Informações pessoais atualizadas com sucesso' });
    });
  });
});
app.post('/sendShipping', (req, res) => {
  // Verificar se o usuário está autenticado
  if (!req.session.id_user) {
    res.status(401).json({ error: 'Usuário não autenticado' });
    return;
  }
  // Obter as informações pessoais do corpo da solicitação
  const shipping = req.body;
  // Atualizar as informações pessoais do usuário no banco de dados
  const email = req.session.id_user;
  const userQuery = `UPDATE kp_user
                     SET name = '${shipping.name}', phone = '${shipping.phone}'
                     WHERE email = '${email}'`;
  const addressQuery = `UPDATE kp_address
                        SET address = '${shipping.address}', zip_code = '${shipping.zip_code}', city = '${shipping.city}', state = '${shipping.state}'
                        WHERE id_user IN (SELECT id_user FROM kp_user WHERE email = '${email}')`;
  connection.query(userQuery, (userErr, userResult) => {
    if (userErr) {
      console.log("Erro: Atualização do usuário não realizada", userErr);
      res.status(500).json({ error: 'Erro no servidor' });
      return;
    }
    if (userResult.affectedRows === 0) {
      res.status(404).json({ error: 'Usuário não encontrado' });
      return;
    }
    connection.query(addressQuery, (addressErr, addressResult) => {
      if (addressErr) {
        console.log("Erro: Atualização do endereço não realizada", addressErr);
        res.status(500).json({ error: 'Erro no servidor' });
        return;
      }
      if (addressResult.affectedRows === 0) {
        res.status(404).json({ error: 'Endereço não encontrado' });
        return;
      }
      res.json({ message: 'Informações pessoais atualizadas com sucesso' });
    });
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
    connection.query(`INSERT INTO \`kp_user_products\` (\`id_user_products\`, \`id_user\`, \`id_product\`, \`quantity\`) 
    VALUES (NULL, (SELECT \`id_user\` FROM \`kp_user\` WHERE \`email\` = '${req.session.id_user}'), (SELECT \`id_product\` FROM \`kp_products\` WHERE
    \`size\` = '${customKeyboard.size}' AND \`connection\` = '${customKeyboard.connection}' AND
    \`switch\` = '${customKeyboard.switch}' AND \`main_color\` = '${customKeyboard.boardColor}' AND
    \`key_color\` = '${customKeyboard.keyColor}' LIMIT 1), '1');`, (err, rows, fields) => {
      if (!err) {
        if (customKeyboard.keycap != '') {
          connection.query(`INSERT INTO \`kp_user_products\` (\`id_user_products\`, \`id_user\`, \`id_product\`, \`quantity\`) 
        VALUES (NULL, (SELECT \`id_user\` FROM \`kp_user\` WHERE \`email\` = '${req.session.id_user}'), (SELECT \`id_product\` FROM \`kp_products\`
        WHERE \`name\` = '${customKeyboard.keycap}' LIMIT 1), '1');`, (err, rows, fields) => {
            if (!err) {
              // console.log('Keycap adicionado ao carrinho!');
            } else {
              console.log("Erro: keycap não adicionada!", err);
              res.status(500).json({ error: 'Erro no servidor' });
            }
          });
        }
        // console.log('Teclado adicionado ao carrinho!');
        res.redirect('/index.html');
      } else {
        console.log("Erro: teclado não adicionado!", err);
        res.status(500).json({ error: 'Erro no servidor' });
      }
    });
  }
});
app.get('/getCart', (req, res) => {
  if (!req.session.id_user) {
    res.redirect('/cart.html?noLogin')
  } else {
    // Obter as informações do carrinho do usuário no banco de dados
    const email = req.session.id_user;
    connection.query(`
  SELECT kp_products.*, 
         kp_user_products.*, 
         kp_user.email, 
         (kp_products.price * kp_user_products.quantity) AS total_price
  FROM kp_products
  INNER JOIN kp_user_products ON kp_products.id_product = kp_user_products.id_product
  INNER JOIN kp_user ON kp_user_products.id_user = kp_user.id_user
  WHERE kp_user.email = '${email}'
`, (err, rows, fields) => {
      if (!err) {
        const cartItems = {
          items: rows
        };
        res.json(cartItems);
        // console.log(cartItems);
      } else {
        console.log("Erro: Consulta não realizada", err);
        return res.status(500).json({ error: 'Erro no servidor' });
      }
    });
  };
});
app.post('/removeProduct', (req, res) => {
  const productId = req.body.id; // Obtenha o ID do produto do corpo da solicitação
  connection.query(`DELETE FROM kp_user_products
    WHERE id_user_products = '${productId}'`, (err, result) => {
    if (!err) {
      if (result.affectedRows === 0) {
        res.status(404).json({ error: 'Produto não encontrado no carrinho' });
      } else {
        res.sendStatus(200); // Envie uma resposta de sucesso ao cliente
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});
app.get('/getProducts', (req, res) => {
  connection.query('SELECT * FROM kp_products', (err, rows, fields) => {
    if (!err) {
      const product = {
        info: rows
      };
      res.json(product);
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});
app.get('/getProductInfo/:id', (req, res) => {
  const productId = req.params.id;
  connection.query(`SELECT * FROM kp_products WHERE id_product = ${productId}`, (err, rows, fields) => {
    if (!err) {
      const product = {
        info: rows
      };
      // console.log(product);
      res.json(product);
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});
app.get('/getShipping', (req, res) => {
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
        const shipping = {
          name: rows[0].name,
          address: rows[0].address,
          zip_code: rows[0].zip_code,
          city: rows[0].city,
          state: rows[0].state,
          phone: rows[0].phone
        };
        res.json(shipping);
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});
app.post('/updateProductQuantity', (req, res) => {
  // Obter o ID do produto e a nova quantidade do corpo da solicitação
  const productId = req.body.id;
  const newQuantity = req.body.quantity;
  // Atualizar a quantidade do produto no banco de dados
  const updateQuery = `UPDATE kp_user_products SET quantity = ${newQuantity} WHERE id_user_products = ${productId}`;
  connection.query(updateQuery, (err, result) => {
    if (err) {
      console.log('Erro: Falha ao atualizar a quantidade do produto', err);
      res.status(500).json({ error: 'Erro no servidor' });
      return;
    }
    if (result.affectedRows === 0) {
      res.status(404).json({ error: 'Produto não encontrado' });
      return;
    }
    res.json({ message: 'Quantidade do produto atualizada com sucesso' });
  });
});

app.post('/payment', (req, res) => {
  const payment = req.body.paymentOptions;
  const currentDate = new Date().toISOString().slice(0, 10);

  const calculateTotalQuery = `SELECT SUM(p.price * up.quantity) AS total
                               FROM kp_user_products up
                               JOIN kp_products p ON up.id_product = p.id_product
                               WHERE up.id_user = 1;`; // Substitua o ID do usuário conforme necessário

  // Executa a consulta para calcular o total
  connection.query(calculateTotalQuery, (err, result) => {
    if (err) {
      console.log('Erro: Falha ao calcular o valor total', err);
      res.status(500).json({ error: 'Erro no servidor' });
      return;
    }

    const cartTotal = result[0].total;

    const insertOrder = `INSERT INTO kp_order(id_user, order_date, total, payment)
                         VALUES((SELECT \`id_user\` FROM \`kp_user\` WHERE \`email\` = '${req.session.id_user}'), 
                         '${currentDate}', ${cartTotal}, '${payment}');`;

    connection.query(insertOrder, (err, result) => {
      if (err) {
        console.log('Erro: Falha ao atualizar a quantidade do produto', err);
        res.status(500).json({ error: 'Erro no servidor' });
        return;
      }
      console.log('Ordem criada');
    });

    if (payment === 'pix') {
      res.redirect('/pix.html');
    } else if (payment === 'boleto') {
      res.redirect('/pagseguro.html')
    } else if (payment === 'credito') {
      res.redirect('/creditCard.html');
    } else if (payment === 'debito') {
      res.redirect('/debitCard.html');
    } else {
      res.redirect('/payment.html');
    }
  });
});

app.get('/getPurchaseHistory', (req, res) => {

  connection.query(`SELECT * FROM kp_order WHERE id_user = (SELECT \`id_user\` FROM \`kp_user\` WHERE \`email\` = '${req.session.id_user}')`, (err, rows, fields) => {
    if (!err) {
      console.log(rows);
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