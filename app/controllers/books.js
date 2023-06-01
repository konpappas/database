const { pool } = require('../utils/database');

/* Controller to retrieve books from database */
exports.getBooks = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter, searchTerm } = req.query;
    const sqlParams = [];
  
    let sqlQuery = `SELECT b.isbn, b.title, b.publisher, b.pages, b.summary, b.available_copies, b.image, b.language, b.keywords, c.name, CONCAT(a.first_name, ' ', a.last_name) AS author_name
                    FROM book b
                    JOIN author a ON b.author_id = a.author_id
                    JOIN category c ON b.category_id = c.category_id `;
  
    if (searchFilter && searchTerm) {
      switch (searchFilter) {
        case 'title':
          sqlQuery += ' WHERE b.title LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
        case 'name':
          sqlQuery += ' WHERE c.name LIKE ?';
          sqlParams.push(`%${searchTerm}%`);
          break;
        case 'author_name':
          sqlQuery += ` WHERE CONCAT(a.first_name, ' ', a.last_name) LIKE ?`;
          sqlParams.push(searchTerm);
          break;
        case 'available_copies':
          sqlQuery += ' WHERE b.available_copies = ?';
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