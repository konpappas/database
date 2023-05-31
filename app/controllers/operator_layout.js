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
