const oneDay = 1000 * 60 * 60 * 24;
const cookieParser = require("cookie-parser");
const sessions = require('express-session');
const express = require('express');
const { Pool } = require('pg');
const app = express();
const cors = require('cors');

app.use(cors()); // Habilita o CORS para permitir solicitações de diferentes origens
app.use(express.static('css')); // Serve arquivos estáticos da pasta 'css'
app.use(express.static('assets')); // Serve arquivos estáticos da pasta 'assets'
app.use(express.static('html')); // Serve arquivos estáticos da pasta 'html'
app.use(express.static('js')); // Serve arquivos estáticos da pasta 'js'

app.use(sessions({
  secret: "thisismysecrctekeyfhrgfgrfrty84fwir767", // Chave secreta usada para assinar as sessões
  saveUninitialized: true,
  cookie: { maxAge: oneDay }, // Configura o tempo de vida do cookie da sessão para um dia
  resave: false
}));

app.use(cookieParser()); // Analisa cookies recebidos nas requisições
app.use(express.json()); // Analisa o corpo da requisição como JSON
app.use(express.urlencoded({ extended: true })); // Analisa o corpo da requisição codificado em URL

app.use((req, res, next) => {
  // Qual site tem permissão de realizar a conexão, no exemplo abaixo está o "*" indicando que qualquer site pode fazer a conexão
  res.header("Access-Control-Allow-Origin", "*");
  // Quais são os métodos que a conexão pode realizar na API
  res.header("Access-Control-Allow-Methods", 'GET,PUT,POST,DELETE');
  next();
});

const pool = new Pool({
  user: 'kampech_g6ay_user',
  host: 'dpg-cimooedph6el95trg8l0-a.oregon-postgres.render.com',
  database: 'kampech_g6ay',
  password: 'puyCQTiGOYCtzhCqgkvkLgPCFvm7jVPZ',
  port: 5432,
  ssl: {
      rejectUnauthorized: false
  }
});

const connection = {
  query: (text, params, callback) => {
      return pool.query(text, params, callback);
  }
};

app.post('/register', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;
  let name = req.body.name;

  connection.query(`INSERT INTO "kp_user" ("id_user", "name", "email", "password", "cpf", "phone") VALUES (DEFAULT, '${name}', '${email}', ${password}, NULL, NULL)`, function (err, result) {
    if (!err) {
      req.session.id_user = email; // ID do usuário inserido no banco de dados
      res.redirect('/personalInfo.html'); // Redireciona para a página 'personalInfo.html' após o registro
    } else {
      console.log("Erro: Consulta não realizada", err);
    }
  });
});

app.post('/login', (req, res) => {
  let email = req.body.email;
  let password = req.body.password;

  connection.query(`SELECT * FROM kp_user where email = '${email}'`, function (err, result) {
    if (!err) {
      if (result.rows.length === 0) {
        res.redirect('/login.html?404account'); // Redireciona para a página 'login.html' com um parâmetro de erro (404account) caso a conta não seja encontrada
      } else {
        if (password === result.rows[0].password) {
          session = req.session;
          session.id_user = req.body.email;
          res.redirect('/personalInfo.html'); // Redireciona para a página 'personalInfo.html' após o login bem-sucedido
        }
        else {
          res.redirect('/login.html?passwordError'); // Redireciona para a página 'login.html' com um parâmetro de erro (passwordError) caso a senha esteja incorreta
        }
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
    }
  });
});

app.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/'); // Redireciona para a página inicial após o logout
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
    WHERE kp_user.email = '${email}'`, (err, result) => {
    if (!err) {
      if (result.rows.length === 0) {
        res.status(404).json({ error: 'Usuário não encontrado' });
      } else {
        // Enviar as informações pessoais do usuário como resposta JSON
        const personalInfo = {
          name: result.rows[0].name,
          address: result.rows[0].address,
          cpf: result.rows[0].cpf,
          zip_code: result.rows[0].zip_code,
          city: result.rows[0].city,
          state: result.rows[0].state,
          phone: result.rows[0].phone
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
  // Receber os dados do teclado personalizado do corpo da solicitação
  const customKeyboard = {
    size: req.body.size,
    connection: req.body.connection,
    switch: req.body.switch,
    keycap: req.body.keycap,
    boardColor: req.body.boardColor,
    keyColor: req.body.keyColor,
    description: `Teclado Custom: Size: ${req.body.size}; Connection: ${req.body.connection}; Switch: ${req.body.switch}; Keycap: ${req.body.keycap}; Board color: ${req.body.boardColor}; Key color: ${req.body.keyColor}`
  };
  console.log(customKeyboard);

  if (!req.session.id_user) {
    // Redirecionar para a página custom.html com o parâmetro noLogin em caso de usuário não autenticado
    res.redirect('/custom.html?noLogin');
  } else {
    // Inserir o teclado personalizado no carrinho do usuário no banco de dados
    connection.query(`INSERT INTO kp_user_products (id_user_products, id_user, id_product, quantity) 
    VALUES (DEFAULT, (SELECT id_user FROM kp_user WHERE email = '${req.session.id_user}'), (SELECT id_product FROM kp_products WHERE
    size = '${customKeyboard.size}' AND connection = '${customKeyboard.connection}' AND
    switch = '${customKeyboard.switch}' AND main_color = '${customKeyboard.boardColor}' AND
    key_color = '${customKeyboard.keyColor}' LIMIT 1), '1');`, (err, result) => {
      if (!err) {
        if (customKeyboard.keycap != '') {
          // Se um keycap estiver definido, inserir o keycap no carrinho do usuário no banco de dados
          connection.query(`INSERT INTO kp_user_products (id_user_products, id_user, id_product, quantity) 
        VALUES (DEFAULT, (SELECT id_user FROM kp_user WHERE email = '${req.session.id_user}'), (SELECT id_product FROM kp_products
        WHERE name = '${customKeyboard.keycap}' LIMIT 1), '1');`, (err, result) => {
            if (!err) {
            } else {
              console.log("Erro: keycap não adicionada!", err);
              res.status(500).json({ error: 'Erro no servidor' });
            }
          });
        }
        // Redirecionar para a página index.html em caso de sucesso
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
    // Redirecionar para a página cart.html com o parâmetro noLogin em caso de usuário não autenticado
    res.redirect('/cart.html?noLogin');
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
`, (err, result) => {
      if (!err) {
        const cartItems = {
          items: result.rows
        };
        // Enviar as informações do carrinho como resposta JSON
        res.json(cartItems);
      } else {
        console.log("Erro: Consulta não realizada", err);
        return res.status(500).json({ error: 'Erro no servidor' });
      }
    });
  };
});

app.post('/removeProduct', (req, res) => {
  // Obter o ID do produto do corpo da solicitação
  const productId = req.body.id;
  connection.query(`DELETE FROM kp_user_products
    WHERE id_user_products = '${productId}'`, (err, result) => {
    if (!err) {
      if (result.affectedRows === 0) {
        // Se nenhum registro for afetado, o produto não foi encontrado no carrinho
        res.status(404).json({ error: 'Produto não encontrado no carrinho' });
      } else {
        res.sendStatus(200); // Enviar uma resposta de sucesso ao cliente
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});

app.get('/getProducts', (req, res) => {
  // Obter todas as informações dos produtos do banco de dados
  connection.query('SELECT * FROM kp_products', (err, result) => {
    if (!err) {
      const product = {
        info: result.rows
      };
      // Enviar as informações dos produtos como resposta JSON
      res.json(product);
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});

app.get('/getProductInfo/:id', (req, res) => {
  const productId = req.params.id;
  // Obter as informações do produto com base no ID fornecido
  connection.query(`SELECT * FROM kp_products WHERE id_product = ${productId}`, (err, result) => {
    if (!err) {
      const product = {
        info: result.rows
      };
      // Enviar as informações do produto como resposta JSON
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
    WHERE kp_user.email = '${email}'`, (err, result) => {
    if (!err) {
      if (result.rows.length === 0) {
        res.status(404).json({ error: 'Usuário não encontrado' });
      } else {
        // Enviar as informações pessoais do usuário como resposta JSON
        const shipping = {
          name: result.rows[0].name,
          email: result.rows[0].email,
          address: result.rows[0].address,
          zip_code: result.rows[0].zip_code,
          city: result.rows[0].city,
          state: result.rows[0].state,
          phone: result.rows[0].phone
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
                               WHERE up.id_user = (SELECT id_user FROM kp_user WHERE email = '${req.session.id_user}');`; // Substitua o ID do usuário conforme necessário

  // Executa a consulta para calcular o total
  connection.query(calculateTotalQuery, (err, result) => {
    if (err) {
      console.log('Erro: Falha ao calcular o valor total', err);
      res.status(500).json({ error: 'Erro no servidor' });
      return;
    }

    const cartTotal = result.rows[0].total;

    const insertOrder = `INSERT INTO kp_order(id_user, order_date, total, payment)
                         VALUES((SELECT id_user FROM kp_user WHERE email = '${req.session.id_user}'), 
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
      return; // Adiciona o return aqui
    } else if (payment === 'boleto') {
      res.redirect('/pagseguro.html');
      return; // Adiciona o return aqui
    } else if (payment === 'credito') {
      res.redirect('/creditCard.html');
      return; // Adiciona o return aqui
    } else if (payment === 'debito') {
      res.redirect('/debitCard.html');
      return; // Adiciona o return aqui
    } else {
      res.redirect('/payment.html');
      return; // Adiciona o return aqui
    }
  });
});

app.get('/getPurchaseHistory', (req, res) => {
  // Consulta o histórico de compras do usuário no banco de dados
  connection.query(`SELECT * FROM kp_order WHERE id_user = (SELECT id_user FROM kp_user WHERE email = '${req.session.id_user}')`, (err, result) => {
    if (!err) {
      console.log(result.rows);
      res.json(result.rows); // Envia o histórico de compras como resposta JSON
    } else {
      console.log("Erro: Consulta não realizada", err);
      res.status(500).json({ error: 'Erro no servidor' });
    }
  });
});

app.listen(3700, () => {
  console.log('Servidor rodando na porta 3700!');
});