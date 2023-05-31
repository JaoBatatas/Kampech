const express = require('express')
const bodyParser = require('body-parser')
const mysql = require('mysql2');
const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.static('css'))
app.use(express.static('assets'))
app.use(express.static('html'))
app.use(express.static('js'))

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'kampech'
});

connection.connect(function (err) {
  console.log("Conexão como o Banco realizada com sucesso!")
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html')
})

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
          res.send('Login realizado com sucesso!');
        }
        else {
          res.send('Senha incorreta');
        }
      }
    } else {
      console.log("Erro: Consulta não realizada", err);
    }
  });
})
app.listen(3700, () => {
  console.log('Servidor rodando na porta 3700!')
})