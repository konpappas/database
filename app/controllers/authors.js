
const { pool } = require('../utils/database');
exports.getAuthors5Books = (req, res, next) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    let sqlQuery = `select CONCAT(a.first_name, ' ', a.last_name) AS author_name
    from book b 
    join author a on a.author_id = b.author_id
    group by b.author_id
    having count(isbn) <= (SELECT MAX(book_count) - 5
                            FROM (SELECT COUNT(isbn) AS book_count
                                  FROM book
                                  GROUP BY author_id) AS counts);`;
                
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery)
        .then(([rows, author]) => {
            res.render('authorsbooks.ejs', {
                pageTitle: "Query 3.1.7",
                author: rows,
                messages: messages,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })
   
}