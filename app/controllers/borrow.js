const { pool } = require('../utils/database');

exports.getBorrowperSchool = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { month, year } = req.query; // Assuming the month value is obtained from the dropdown
    const sqlParams =[];

    let sqlQuery = `SELECT COUNT(b.borrow_id), s.name 
    FROM borrow b 
    JOIN user u ON b.user_id = u.user_id
    JOIN school s ON u.school_id = s.school_id`;

    if(month && year){
        sqlQuery += ` WHERE MONTH(b.borrowing_date) = ? AND YEAR(b.borrowing_date)=? 
        GROUP BY u.school_id
        ORDER BY u.school_id`;
        sqlParams.push(`%${month, year}%`);
    }
    else{
        sqlQuery += ` 
        GROUP BY u.school_id
        ORDER BY u.school_id`;
    }
    
    
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery, [month, year])
        .then(([rows, data]) => {
            //const school= rows[0]; // Assuming the first row of the results contains the user details
            res.render('borrowschool.ejs', {
                pageTitle: "Borrow School Page",
                data: rows,
                messages: messages,
                submitted: req.method === 'GET',
                month: month,
                year: year
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
        
    })

}

exports.getBorrowYoung = (req, res, next) => {
        /* check for messages in order to show them when rendering the page */
        let messages = req.flash("messages");
        if (messages.length == 0) messages = [];
    
        let sqlQuery = `SELECT CONCAT(u.first_name, ' ', u.last_name) AS professor_name, count(b.borrow_id) AS number_of_books
                        from user u 
                        join borrow b on b.user_id=u.user_id
                        where age < 40 and user_type = 'professor'
                        group by b.user_id
                        order by number_of_books desc;`;
                    
        /* create the connection, execute query, render data */
        pool.getConnection((err, conn) => {
            if (err) {
                console.error('Error acquiring database connection:', err);
                return next(err);
              }
            conn.promise().query(sqlQuery)
            .then(([rows, borrow]) => {
                res.render('borrowyoung.ejs', {
                    pageTitle: "Query 3.1.3",
                    borrow: rows,
                    messages: messages,
                  });
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
        })
       
}