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
    const school_name = req.body.school_name;
    const age = req.body.age;

    /* create the connection, execute query, flash respective message, and redirect to grades route */
    pool.getConnection((err, conn) => {
        const getSchoolIdQuery = 'SELECT school_id FROM school WHERE school.name = ?';

        conn.promise().query(getSchoolIdQuery, [school_name])
            .then(([rows]) => {
                if (rows.length === 0) {
                    // Handle the case when the school_name does not exist in the school table
                    throw new Error('School not found');
                }

                const school_id = rows[0].school_id;

                var sqlQuery = `INSERT INTO User(username, password, first_name, last_name, email, user_type, school_id, approved, age) VALUES (?, ?, ?, ?, ?, ?, ?, '0', ?)`;

                return conn.promise().query(sqlQuery, [username, password, first_name, last_name, email, user_type, school_id, age]);
            })
            .then(() => {
                pool.releaseConnection(conn);
                req.flash('messages', { type: 'success', value: "Successfully added a new User!" })
                res.redirect('/');
            })
            .catch(err => {
                console.error(err);
                res.send("Something went wrong, User could not be added.");
            });
    });
};


