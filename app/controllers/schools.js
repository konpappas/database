const { pool } = require('../utils/database');

exports.getSchools = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
  
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
          }
        
        let sqlQuery = 'SELECT * FROM School';
        conn.promise().query(sqlQuery)
        .then(([rows, schools]) => {
            res.render('schools.ejs', {
                pageTitle: "School Page",
                schools: rows,
                messages: messages,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

exports.postSchool = (req, res, next) => {
    const name = req.body.name;
    const address = req.body.address;
    const city = req.body.city;
    const email = req.body.email;
    const phone = req.body.phone;
    const director_name = req.body.director_name;
    const library_operator_name = req.body.library_operator_name;


    pool.getConnection((err,conn) =>{
        var sqlQuery = `INSERT INTO school(name, address, city, email, phone, director_name, library_operator_name) VALUES (?, ?, ?, ?, ?, ?, ?)`;

        conn.promise().query(sqlQuery, [name, address, city, email, phone, director_name, library_operator_name])
        .then(() =>{
            pool.releaseConnection(conn);
            res.redirect('/schools');
        })
        .catch(err => {
            res.send(err);
            //res.redirect('/users');
        })
    })

}