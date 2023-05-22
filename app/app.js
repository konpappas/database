const express = require('express');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash');

require('custom-env').env('localhost');

/* ROUTES and how to import routes */

/*const layout = require('./routes/layout');
const schools = require('./routes/schools');
const users = require('./routes/users');
const reservations = require('./routes/reservations');
const reviews = require('./routes/reviews');
const borrow = require('./routes/borrow');*/
const books = require('./routes/books');
//const authors = require('./routes/authors');
//const categories = require('./routes/categories');
//ΨΡΕΑΤΕconst queries = require('./routes/queries');

/* end of ROUTES and how to import routes */

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

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

/*app.use('/', layout);
app.use('/schools', schools);
app.use('/users', users);
app.use('/reservations', reservations);
app.use('/reviews', reviews);
app.use('/borrow', borrow);*/
app.use('/books', books);
/*app.use('/authors', authors);
app.use('/categories', categories);
app.use('/queries', queries);*/
/* End of routes used by the project */

// In case of an endpoint does not exist must return 404.html
app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) })

module.exports = app;