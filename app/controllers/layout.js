const { pool } = require('../utils/database');

exports.getLanding = (req, res, next) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    res.render('layout.ejs', {
        pageTitle: "Landing Page"
    });
}

exports.getCreateUser = (req, res, next) =>{
    res.render('signup.ejs',{
        pageTitle: "User SignUp"
    })
}

exports.getLogin = (req, res, next) =>{
    res.render('login.ejs',{
        pageTitle: "User Login"
    })
}
//φτιάχνω και τα υπολοιπα κουτακια που θα φαινονται στην κεντρικη σελίδα με 
//τις απαντησεις των queries, τα view tables, create a new object
