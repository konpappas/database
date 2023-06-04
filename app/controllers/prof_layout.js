const pool = require('../utils/database'); // Assuming you have a database connection pool defined

exports.getLanding = (req, res, next) => {
  /* check for messages in order to show them when rendering the page */
  let messages = req.flash("messages");
  if (messages.length == 0) messages = [];

  res.render('admin_layout.ejs', {
      pageTitle: "Administrator Landing Page"
  });
}
// Controller function for displaying book details
exports.displayBookDetails = (req, res) => {
  const bookId = req.params.id;
  const sqlQuery = `
    SELECT Books.*, AVG(Reviews.rating) AS avg_rating
    FROM Book
    LEFT JOIN Reviews ON Book.book_id = Review.book_id
    WHERE Book.book_id = ?
    GROUP BY Book.book_id
  `;

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [bookId])
      .then(([rows, fields]) => {
        const book = rows[0];
        res.render('book-details.ejs', { pageTitle: 'Book Details', book });
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for submitting a review for a book
exports.submitReview = (req, res) => {
  const bookId = req.params.id;
  const userId = req.session.userId;
  const { reviewText, rating } = req.body;
  const sqlQuery = 'INSERT INTO Review (isbn, user_id, review_text, rating) VALUES (?, ?, ?, ?)';

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [ISBN, userId, reviewText, rating])
      .then(() => {
        res.redirect('/books/' + ISBN);
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for approving or rejecting a review
exports.approveReview = (req, res) => {
  const reviewId = req.params.id;
  const isApproved = req.body.isApproved === 'true' ? 1 : 0;
  const sqlQuery = 'UPDATE Review SET is_approved = ? WHERE review_id = ?';

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [isApproved, reviewId])
      .then(() => {
        res.redirect('/reviews/pending');
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for viewing pending reviews for approval
exports.viewPendingReviews = (req, res) => {
  const sqlQuery = 'SELECT * FROM Review WHERE is_approved = 0';

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery)
      .then(([rows, fields]) => {
        const reviews = rows;
        res.render('pending-reviews.ejs', { pageTitle: 'Pending Reviews', reviews });
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for cancelling a reservation
exports.cancelReservation = (req, res) => {
  const reservationId = req.params.id;
  const sqlQuery = 'DELETE FROM Reservation WHERE reservation_id = ?';

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [reservationId])
      .then(() => {
        res.redirect('/reservations');
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for viewing borrowed books by the user
exports.viewBorrowedBooks = (req, res) => {
  const userId = req.session.userId;
  const sqlQuery = `
  SELECT b.title, bo.borrowing_date, bo.returning_date
  FROM book b
  JOIN borrow bo ON b.isbn = bo.isbn
  JOIN user u ON bo.user_id = u.user_id
  WHERE u.user_id = ?
  ;`;

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [userId])
      .then(([rows, fields]) => {
        const books = rows;
        res.render('borrows.ejs', { pageTitle: 'Borrowed Books', books });
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for displaying user's profile information
exports.displayUserProfile = (req, res) => {
  const userId = req.session.userId;
  const sqlQuery = 'SELECT * FROM User WHERE user_id = ?';

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [userId])
      .then(([rows, fields]) => {
        const user = rows[0];
        res.render('profile.ejs', { pageTitle: 'My Profile', user });
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};

// Controller function for updating user's profile information
exports.updateUserProfile = (req, res) => {
  const userId = req.session.userId;
  const { firstName, lastName, email } = req.body;
  const sqlQuery = 'UPDATE User SET first_name = ?, last_name = ?, email = ? WHERE user_id = ?';

  pool.getConnection((err, conn) => {
    if (err) {
      console.error('Error acquiring database connection:', err);
      return res.redirect('/error');
    }

    conn.promise()
      .query(sqlQuery, [firstName, lastName, email, userId])
      .then(() => {
        res.redirect('/profile');
      })
      .then(() => pool.releaseConnection(conn))
      .catch((err) => {
        console.error('Error executing SQL query:', err);
        res.redirect('/error');
      });
  });
};
