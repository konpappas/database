const { pool } = require('../utils/database');

exports.getReservations = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter, searchTerm} = req.query;
    const sqlParams = [];
    const schoolId = req.session.schoolId;
  
    let sqlQuery = `SELECT reservation_id, reservation_date, expiration_date, r.user_id, isbn
                            from reservation r
                            JOIN user u ON r.user_id = u.user_id
                            where u.school_id = ? `;

    // if (searchFilter1 === 'Valid') {
    //     sqlQuery += ' AND (returning_date > CURDATE() OR returned = 1) ';
    //     sqlParams.push(userId);
    // } else if (searchFilter1 === 'Delayed') {
    //     sqlQuery += ' AND (returning_date <= CURDATE() AND returned = 0) ';
    //     sqlParams.push(userId);
    // }
    // else{ 
     sqlParams.push(schoolId);
    //}
  
    if (searchFilter && searchTerm) {
      switch (searchFilter) {
        case 'user_id':
          sqlQuery += ' AND b.user_id = ?';
          sqlParams.push(searchTerm);
          break;
        // case'first_name':
        // sqlQuery += ' AND u.first_name = ?';
        // sqlParams.push(searchTerm);
        // break;
        // case'last_name':
        // sqlQuery += ' AND u.last_name = ?';
        // sqlParams.push(searchTerm);
        // break;
        // case'delaydays':
        // sqlQuery += ' AND DATEDIFF(CURDATE(), b.returning_date) = ?';
        // sqlParams.push(searchTerm);
        // break;
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
        .then(([rows, reservations]) => {
            console.log('Query Result:', rows);
            res.render('reservations.ejs', {
                pageTitle: "Reservations Page",
                reservations: rows,
                messages: messages
                // searchFilter: searchFilter,
                // searchFilter1: searchFilter1,
                // searchTerm: searchTerm

              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}