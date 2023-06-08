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
          sqlQuery += ' AND r.user_id = ?';
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



exports.addBorrow = (req, res, next) => {
  let messages = req.flash("messages");
  if (messages.length == 0) messages = [];
  
  const isbn = req.body.isbn;
  const user_id = req.body.user_id;
  const operator_id = req.session.userId;
  const reservation_id = req.body.reservation_id;

  pool.getConnection((err, conn) => {
    if (err) {
      // Handle the error
      res.send(err);
      return;
    }
  
    conn.beginTransaction((err) => {
      if (err) {
        // Handle the error
        res.send(err);
        return;
      }
  
      const countQuery = 'SELECT COUNT(*) AS borrow_count FROM borrow WHERE user_id = ?';
      const countParams = [user_id];
  
      conn.query(countQuery, countParams, (err, countResult) => {
        if (err) {
          // Handle the error
          conn.rollback(() => {
            res.send(err);
          });
          return;
        }
  
        const borrowCount = countResult[0].borrow_count;

      const countQuery1 = 'SELECT user_type FROM user WHERE user_id = ?';
      const countParams1 = [user_id];
  
      conn.query(countQuery1, countParams1, (err, userTypeResult) => {
        if (err) {
          // Handle the error
          conn.rollback(() => {
            res.send(err);
          });
          return;
        }
  
        const role = userTypeResult[0].user_type;
        if ((borrowCount >= 2 && role === 'student') || (borrowCount >= 1 && role === 'professor')) {
          // User has more than 2 borrows, handle the error or show a message
          conn.rollback(() => {
            const error = new Error('User has reached the maximum number of borrows.');
            res.send(error);
          });
          return;
        }
      });
  
        const insertQuery = 'INSERT INTO borrow (borrowing_date, returning_date, user_id, isbn, operator_id, returned) VALUES (CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), ?, ?, ?, 0)';
        const insertParams = [user_id, isbn, operator_id];
  
        conn.query(insertQuery, insertParams, (err, insertResult) => {
          if (err) {
            // Handle the error
            conn.rollback(() => {
              res.send(err);
            });
            return;
          }
  
          const deleteQuery = 'DELETE FROM reservation WHERE reservation_id = ?';
          const deleteParams = [reservation_id];
  
          conn.query(deleteQuery, deleteParams, (err, deleteResult) => {
            if (err) {
              // Handle the error
              conn.rollback(() => {
                res.send(err);
              });
              return;
            }
  
            conn.commit((err) => {
              if (err) {
                // Handle the error
                conn.rollback(() => {
                  res.send(err);
                });
              } else {
                // Both statements executed successfully
                conn.release();
                res.redirect('/reservations');
              }
            });
          });
        });
      });
    });
  });
}


exports.getUserReservations = (req, res, next) => {

  /* check for messages in order to show them when rendering the page */
  let messages = req.flash("messages");
  if (messages.length == 0) messages = [];

  // const { searchFilter, searchTerm} = req.query;
  const sqlParams = [];
  const userId = req.session.userId;

  let sqlQuery = `SELECT reservation_id, reservation_date, expiration_date, user_id, isbn
                          from reservation 
                          where user_id = ? `;

                          sqlParams.push(userId);

  // if (searchFilter1 === 'Valid') {
  //     sqlQuery += ' AND (returning_date > CURDATE() OR returned = 1) ';
  //     sqlParams.push(userId);
  // } else if (searchFilter1 === 'Delayed') {
  //     sqlQuery += ' AND (returning_date <= CURDATE() AND returned = 0) ';
  //     sqlParams.push(userId);
  // }
  // else{ 

  //}

  // if (searchFilter && searchTerm) {
  //   switch (searchFilter) {
  //     case 'user_id':
  //       sqlQuery += ' AND r.user_id = ?';
  //       sqlParams.push(searchTerm);
  //       break;
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
    // }
  // }

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
          res.render('userreservation.ejs', {
              pageTitle: "My Reservations",
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

exports.postdeleteReservation = (req, res, next) => {

  const isbn = req.body.isbn;
  const reservation_id = req.body.reservation_id;

  pool.getConnection((err,conn) =>{

    const decCopies = 'UPDATE book SET available_copies = available_copies + 1 WHERE isbn = ?';
    const copiesParams = [isbn];

    conn.query(decCopies, copiesParams, (err, avResult) => {
        if (err) {
          // Handle the error
          conn.rollback(() => {
            res.send(err);
          });
          return;
        }
    });

      var sqlQuery = `DELETE FROM reservation WHERE reservation_id = ?`;

      conn.promise().query(sqlQuery, [reservation_id])
      .then(() =>{
          pool.releaseConnection(conn);
          res.redirect('/reservations/users');
      })
      .catch(err => {
          res.send(err);
          //res.redirect('/users');
      })
  })
}