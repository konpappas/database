const express = require('express');
const path = require('path');
const session = require('express-session');
const cookie =require('cookie-parser');
const ejs= require ('ejs');
const multer = require('multer');
const async = require ('async');
const crypto = require ('crypto');
const expressValidator = require ('express-validator');
const  sweetalert = require('sweetalert2');
const flash = require('connect-flash');
var bodyParser = require("body-parser");
//const cors = require("cors");

require('custom-env').env('localhost');

/* ROUTES and how to import routes */

const layout = require('./routes/layout');
const schools = require('./routes/schools');
/*const reservations = require('./routes/reservations');
const reviews = require('./routes/reviews');*/
const borrows = require('./routes/borrows');
const books = require('./routes/books');
const authors = require('./routes/authors');
const categories = require('./routes/categories');
const login = require('./routes/login');
const signup = require('./routes/signup');
const resetpassword = require('./routes/resetpassword');
const operator_layout = require('./routes/operator_layout');
const admin_layout = require('./routes/admin_layout');
const users= require('./routes/users');
const operators = require('./routes/operators');


/* end of ROUTES and how to import routes */

const app = express();

//Middleware to parse JSON requests
app.use(express.json());
//Middleware to parse URL-encoded requests
app.use(express.urlencoded({ extended: true }));

app.use(cookie());

// Serve static files from the 'public' folder
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');

app.use(flash());

app.use(session({
    secret: "ThisShouldBeSecret",
    resave: false,
    saveUninitialized: false
}));

/* Routes used by the project */

app.use('/', layout);
app.use('/schools', schools);
/*app.use('/reservations', reservations);
app.use('/reviews', reviews);*/
app.use('/borrows', borrows);
app.use('/books', books);
app.use('/authors', authors);
app.use('/categories', categories);
app.use('/login', login);
app.use('/signup', signup);
app.use('/resetpassword', resetpassword);
app.use('/operator_layout', operator_layout);
app.use('/admin_layout', admin_layout);
app.use('/users', users);
app.use('/operators', operators);


/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })

module.exports = app;