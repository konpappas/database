const { pool } = require('../utils/database');

/* Controller to create a new user in the database */
exports.postUser = (req, res, next) => {

    /* get necessary data sent */
    const username = req.body.username;
    const password = req.body.password;
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const email = req.body.email;
    const user_type = req.body.user_type;
    const school_id = req.body.school_id;

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO User(username, password, first_name, last_name, email, user_type, school_id, approved) VALUES(?, ?, ?, ?, ?, ?, ?, '0')`;

        conn.promise().query(sqlQuery, [username, password, first_name, last_name, email, user_type,school_id])
        .then(() => {
            pool.releaseConnection(conn);
            req.flash('messages', { type: 'success', value: "Successfully added a new User!" })
            res.redirect('/');
        })
        .catch(err => {
           res.send("Something went wrong, User could not be added.");
            //res.redirect('/');
        })
    })
}

