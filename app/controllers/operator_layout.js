const { pool } = require('../utils/database');

exports.getLanding = (req, res, next) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    res.render('operator_layout.ejs', {
        pageTitle: "Operator Landing Page"
    });
}

exports.getOperatorUser = (req, res, next) =>{
    res.render('users.ejs',{
        pageTitle: "User Approval"
    })
}

exports.getOperatorBook = (req, res, next) =>{
    res.render('books.ejs',{
        pageTitle: "Book Management"
    })
}

exports.getAddBook = (req, res, next) => {
    res.render('add-books.ejs',{
        pageTitle: "Insert a book in library"
    })
}

exports.getOperatorBorrow = (req, res, next) =>{
    res.render('borrows.ejs',{
        pageTitle: "Borrow View"
    })
}

exports.getOperatorQuery3 = (req, res, next) =>{
    res.render('opq3.ejs',{
        pageTitle: "Query 3.2.3"
    })
}



exports.getOperatorReservation = (req, res, next) =>{
    res.render('reservations.ejs',{
        pageTitle: "Reservation View"
    })
}

exports.getAddBorrow = (req, res, next) =>{
    res.render('add-borrow.ejs',{
        pageTitle: "Insert a borrow"
    })
}
