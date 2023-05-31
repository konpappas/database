const { pool } = require('../utils/database');

/* Controller to retrieve users from database */
exports.getUsers = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter } = req.query;
    const sqlParams = [];
  
    let sqlQuery = 'SELECT * FROM User WHERE (user_type = "student" OR user_type = "professor")';
  
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
            res.render('users.ejs', {
                pageTitle: "Users Page",
                users: rows,
                messages: messages,
                searchFilter: searchFilter,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


exports.postApproveUsers = (req, res, next) => {
    const user_id = req.body.user_id;
    const approved = req.body.approved=== "true" ? 1 : 0; 

    pool.getConnection((err,conn) =>{
        var sqlQuery = `UPDATE User SET approved = ? WHERE user_id = ?`;

        conn.promise().query(sqlQuery, [approved, user_id])
        .then(() =>{
            pool.releaseConnection(conn);
            res.redirect('/users');
        })
        .catch(err => {
            res.send(err);
            //res.redirect('/users');
        })
    })

}

exports.postdeleteUsers = (req, res, next) => {
    const user_id = req.params.user_id;

    pool.getConnection((err,conn) =>{
        var sqlQuery = `DELETE FROM User WHERE user_id = ?`;

        conn.promise().query(sqlQuery, [user_id])
        .then(() =>{
            pool.releaseConnection(conn);
            res.redirect('/users');
        })
        .catch(err => {
            res.send(err);
            //res.redirect('/users');
        })
    })
}

