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

exports.getsameBorrow = (req, res, next) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    let sqlQuery = `SELECT CONCAT(U.first_name, ' ', U.last_name) AS operator_name, COUNT(*) AS loan_count
                    FROM Borrow B
                    JOIN User U ON B.operator_id = U.user_id
                    WHERE B.borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
                    GROUP BY B.operator_id
                    HAVING loan_count > 20
                    AND loan_count = (
                        SELECT COUNT(*) AS same_loan_count
                        FROM Borrow
                        WHERE borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
                        GROUP BY operator_id
                        HAVING operator_id = B.operator_id
                    )`;
                
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery)
        .then(([rows, operator]) => {
            res.render('sameborrow.ejs', {
                pageTitle: "Query 3.1.5",
                operator: rows,
                messages: messages,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })
   
}

exports.getBorrows = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter, searchTerm, searchFilter1 } = req.query;
    const sqlParams = [];
    const userId = req.session.userId;
  
    let sqlQuery = `SELECT borrow_id, borrowing_date, returning_date, b.user_id, u.first_name, u.last_name, isbn, operator_id, returned
                    from borrow b
                    JOIN user u ON b.user_id = u.user_id
                    where operator_id = ? `;

    if (searchFilter1 === 'Valid') {
        sqlQuery += ' AND (returning_date > CURDATE() OR returned = 1) ';
        sqlParams.push(userId);
    } else if (searchFilter1 === 'Delayed') {
        sqlQuery += ' AND (returning_date <= CURDATE() AND returned = 0) ';
        sqlParams.push(userId);
    }
    else{ 
     sqlParams.push(userId);
    }
  
    if (searchFilter && searchTerm) {
      switch (searchFilter) {
        case 'user_id':
          sqlQuery += ' AND b.user_id = ?';
          sqlParams.push(searchTerm);
          break;
        case'first_name':
        sqlQuery += ' AND u.first_name = ?';
        sqlParams.push(searchTerm);
        break;
        case'last_name':
        sqlQuery += ' AND u.last_name = ?';
        sqlParams.push(searchTerm);
        break;
        case'delaydays':
        sqlQuery += ' AND DATEDIFF(CURDATE(), b.returning_date) = ?';
        sqlParams.push(searchTerm);
        break;
      }
    }

    console.log('sqlQuery:', sqlQuery);
    console.log('sqlParams:', sqlParams);
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, borrows]) => {
            console.log('Query Result:', rows);
            res.render('borrows.ejs', {
                pageTitle: "Borrows Page",
                borrows: rows,
                messages: messages,
                searchFilter: searchFilter,
                searchFilter1: searchFilter1,
                searchTerm: searchTerm

              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

exports.postReturn = (req, res, next) => {
    const borrow_id = req.body.borrow_id;
    const returned = req.body.returned === "true" ? 1 : 0; 
    const isbn = req.body.isbn;
    
    pool.getConnection((err,conn) =>{
        let updateBorrowQuery = `UPDATE borrow SET returned = ? WHERE borrow_id = ?`;
        let updateBookQuery = `UPDATE book SET available_copies = available_copies + 1 WHERE isbn = ?`;
  
        Promise.all([
            conn.promise().query(updateBorrowQuery, [returned, borrow_id]),
            conn.promise().query(updateBookQuery, [isbn])
        ])
            .then(() => {

                conn.release();
                res.redirect('/borrows/view');
            })
            .catch(err => {
                console.error(err);
                res.send('Something went wrong.');
            });
    });
}
