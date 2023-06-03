const { pool } = require('../utils/database');

exports.getCategChoice= (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { category } = 'Education';//req.query; // Assuming the month value is obtained from the dropdown

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        let sqlQuery = `SELECT * FROM authors_and_professors`;
        
       // if(category){
            let sqlParams = [`%${category}%`]; // Pass the search term as a parameter
        
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, data]) => {
          
            res.render('categauthorsprof.ejs', {
                pageTitle: "Query 3.1.2",
                data: rows,
                messages: messages,
                submitted: req.method === 'GET',
                category: category,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
        
    })

}
