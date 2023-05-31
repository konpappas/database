const { pool } = require('../utils/database');

exports.getOperators = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter } = req.query;
    const sqlParams = [];
  
    let sqlQuery = 'SELECT * FROM User WHERE user_type = "library_operator"';
  
    if (searchFilter === 'approved:1') {
        sqlQuery += ' AND approved = 1 ';
    } else if (searchFilter === 'approved:0') {
        sqlQuery += ' AND approved = 0';
    }
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, users]) => {
            res.render('operators.ejs', {
                pageTitle: "Operators Page",
                users: rows,
                messages: messages,
                searchFilter: searchFilter,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

exports.postApproveOperators = (req, res, next) => {
    const user_id = req.body.user_id;
    const approved = req.body.approved=== "true" ? 1 : 0; 

    pool.getConnection((err,conn) =>{
        var sqlQuery = `UPDATE User SET approved = ? WHERE user_id = ?`;

        conn.promise().query(sqlQuery, [approved, user_id])
        .then(() =>{
            pool.releaseConnection(conn);
            res.redirect('/operators');
        })
        .catch(err => {
            res.send(err);
            //res.redirect('/users');
        })
    })

}