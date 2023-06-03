const { pool } = require('../utils/database');

exports.getCategChoice = (req, res, next) => {

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

exports.getTop3Cat = (req, res, next) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    let sqlQuery = `SELECT C1.name AS category1, C2.name AS category2, COUNT(*) AS pair_count
                    FROM Book B
                    JOIN Category C1 ON B.category_id = C1.category_id
                    JOIN Category C2 ON B.sec_category_id = C2.category_id
                    JOIN Borrow Br ON B.isbn = Br.isbn
                    GROUP BY C1.name, C2.name
                    ORDER BY pair_count DESC
                    LIMIT 3;`;
                
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
            }
        conn.promise().query(sqlQuery)
        .then(([rows, categ]) => {
            res.render('top3cat.ejs', {
                pageTitle: "Query 3.1.6",
                categ: rows,
                messages: messages,
                });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}