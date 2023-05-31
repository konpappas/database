const { pool } = require('../utils/database');

/* Controller to retrieve books from database */
exports.getBooks = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter, searchTerm } = req.query;
    const sqlParams = [];
  
    let sqlQuery = 'SELECT * FROM book';
  
    if (searchFilter && searchTerm) {
      switch (searchFilter) {
        case 'title':
          sqlQuery += ' WHERE title LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
        case 'category_id':
          sqlQuery += ' WHERE category_id LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
        case 'author_id':
          sqlQuery += ' WHERE author_id LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
        case 'available_copies':
          sqlQuery += ' WHERE number_of_copies = ?';
          sqlParams.push(searchTerm);
          break;
      }
    }
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, books]) => {
            res.render('books.ejs', {
                pageTitle: "Books Page",
                books: rows,
                messages: messages,
                searchFilter: searchFilter,
                searchTerm: searchTerm
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}