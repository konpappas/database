const { pool } = require('../utils/database');

exports.getCategChoice =  (req, res, next) => {

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
  
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            return res.send('Failed to establish a connection to the database.');
        }
    
        const { category } = req.query;
        const sqlParams = [];
    
        let sqlQuery = `SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS author_name
                        FROM book b
                        JOIN author a ON a.author_id = b.author_id
                        JOIN category c ON c.category_id = b.category_id`;
    
        let secondQuery = `SELECT DISTINCT CONCAT(u.first_name, ' ', u.last_name) AS user_name
                            FROM borrow br
                            JOIN user u ON u.user_id = br.user_id
                            JOIN book b ON b.isbn = br.isbn
                            JOIN category c ON c.category_id = b.category_id`;
    
        if (category) {
            sqlQuery += ` WHERE c.name = ?`;
            secondQuery += ` WHERE c.name = ? AND u.user_type = 'Professor' AND br.borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)`;
            sqlParams.push(category); // Pass the category as a parameter
        }
    
        Promise.all([
            conn.promise().query(sqlQuery, sqlParams),
            conn.promise().query(secondQuery, sqlParams)
        ])
            .then(([authorRows, userRows]) => {
                const authorData = authorRows[0];
                const userData = userRows[0];
    
                conn.release();
    
                res.render('categauthorsprof.ejs', {
                    pageTitle: 'Query 3.1.2',
                    messages,
                    authorData,
                    userData,
                    category
                });
            })
            .catch(err => {
                console.error(err);
                res.send('Something went wrong.');
            });
    });
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