const { pool } = require('../utils/database');

/* Controller to retrieve books from database */
exports.getoperquery3 = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter, searchTerm } = req.query;
    const sqlParams = [];
    const schoolId = req.session.schoolId;
  
    let sqlQuery = `SELECT u.user_id, CONCAT(u.first_name, ' ', u.last_name) AS user_name, c.name, AVG(r.rating) AS average_rating
                    FROM user u
                    JOIN borrow bo ON u.user_id = bo.user_id
                    JOIN book b ON bo.isbn = b.isbn
                    JOIN review r ON bo.isbn = r.isbn
                    JOIN category c ON b.category_id = c.category_id
                     `;

    
    sqlQuery += ' WHERE u.school_id = ?';
    sqlParams.push(schoolId);
  
    if (searchFilter && searchTerm) {
      switch (searchFilter) {
        case 'user_ID':
          sqlQuery += ' AND user_id LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
        case 'name':
          sqlQuery += ' AND c.name LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
      }
    }

    sqlQuery += ` GROUP BY u.user_id, u.first_name, u.last_name, b.category_id;`;


    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, reviews]) => {
            res.render('opq3.ejs', {
                pageTitle: "Average Rating Page",
                reviews: rows,
                messages: messages,
                searchFilter: searchFilter,
                searchTerm: searchTerm
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


