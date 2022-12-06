const express = require('express');
const app = express();
const mysql = require('mysql2');
//motor de plantilla
const hbs = require('hbs');
//encontrar archivo
const path = require('path');
//enviar mails
const nodemailer = require('nodemailer');
//variables de entorno
require('dotenv').config();

//configuramos el puerto
const PORT = process.env.PORT || 9000;

//middelware
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
app.use(express.static(path.join(__dirname, 'public')));

//configuramos el motor de plantilla de hbs
app.set('view engine', 'hbs');
//configuramos la ubicacion de las plantillas
app.set('views', path.join(__dirname, 'views'));
//configuramos los parciales de los motores de plantilla
hbs.registerPartials(path.join(__dirname, 'views/partials'));

//conexion a la base de datos
const conexion = mysql.createConnection({
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    port: process.env.DBPORT  

})

conexion.connect((err) =>{
    if(err) throw err;
    console.log('conectado a la Database ${process.env.DATABASE}');
})

//rutas de la aplicacion
app.get('/', (req, res) => {
    res.send('Bienvenido a lesnat')
})

//servidor a la escucha de las peticiones
app.listen(PORT, ()=>{
    console.log('servidor trabajando en el puerto: ${PORT}');
}) 