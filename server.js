const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2/promise'); // Importe o pacote mysql2/promise para usar o método createPool

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('css'));
app.use(express.static('assets'));
app.use(express.static('html'));
app.use(express.static('js'));

const pool = mysql.createPool({ // Use createPool em vez de createConnection
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'kampech'
});

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.post('/login', async (req, res) => { // Use async/await para tornar a função assíncrona
  let email = req.body.email;
  let password = req.body.password;

  try {
    const connection = await pool.getConnection(); // Obtenha uma conexão da piscina

    const [rows, fields] = await connection.execute(`SELECT * FROM kp_user WHERE email = ?`, [email]); // Use prepared statements para evitar ataques de SQL Injection

    connection.release(); // Libere a conexão de volta para a piscina

    if (rows.length === 0) {
      res.redirect('/login.html?404account');
    } else {
      if (password === rows[0].password) {
        res.redirect('/personalInfo.html');
      } else {
        res.redirect('/login.html?passwordError');
      }
    }
  } catch (error) {
    console.log('Erro: Consulta não realizada', error);
  }
});

app.listen(3700, () => {
  console.log('Servidor rodando na porta 3700!');
});
