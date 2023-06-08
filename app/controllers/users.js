const { name } = require('ejs');
const { pool } = require('../utils/database');

/* Controller to retrieve users from database */
exports.getUsers = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const { searchFilter } = req.query;
    const sqlParams = [];
    const schoolId = req.session.schoolId;
  
    let sqlQuery = 'SELECT * FROM User WHERE (user_type = "student" OR user_type = "professor")';
  
    if (searchFilter === 'approved:1') {
        sqlQuery += ' AND approved = 1 ';
    } else if (searchFilter === 'approved:0') {
        sqlQuery += ' AND approved = 0';
    }

    sqlQuery += ' AND school_id = ?';
    sqlParams.push(schoolId);
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
        }
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, users]) => {
            res.render('users.ejs', {
                pageTitle: "Users Page",
                users: rows,
                messages: messages,
                searchFilter: searchFilter,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}


exports.postApproveUsers = (req, res, next) => {
    const user_id = req.body.user_id;
    const approved = req.body.approved=== "true" ? 1 : 0; 

    pool.getConnection((err,conn) =>{
        var sqlQuery = `UPDATE User SET approved = ? WHERE user_id = ?`;

        conn.promise().query(sqlQuery, [approved, user_id])
        .then(() =>{
            pool.releaseConnection(conn);
            res.redirect('/users');
        })
        .catch(err => {
            res.send(err);
            //res.redirect('/users');
        })
    })

}

exports.postdeleteUsers = (req, res, next) => {
    const user_id = req.params.user_id;

    pool.getConnection((err,conn) =>{
        var sqlQuery = `DELETE FROM User WHERE user_id = ?`;

        conn.promise().query(sqlQuery, [user_id])
        .then(() =>{
            pool.releaseConnection(conn);
            res.redirect('/users');
        })
        .catch(err => {
            res.send(err);
            //res.redirect('/users');
        })
    })
}

exports.getMyinfo = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    const sqlParams = [];
    const userId = req.session.userId;

    let sqlQuery = `SELECT user_id, first_name, last_name, u.email, s.name, age
                     FROM User u
                     JOIN school s ON u.school_id = s.school_id
                     WHERE user_id = ?`;
    sqlParams.push(userId);
  
    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
        }
        conn.promise().query(sqlQuery, sqlParams)
        .then(([rows, users]) => {
            res.render('profile.ejs', {
                pageTitle: "Users Page",
                users: rows,
                messages: messages,
              });
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })

}

exports.postProfChangeInfo = (req, res, next) => {

    const user_type = req.session.usertype;

    if(user_type === 'professor'){
        const user_id = req.body.user_id;
        const schname=req.body.name;;
        const updatedFields = {};

        // Check if each field is provided in the request body and add it to the updatedFields object
        
        if (req.body.first_name) {
        updatedFields.first_name = req.body.first_name;
        }
        if (req.body.last_name) {
        updatedFields.last_name = req.body.last_name;
        }
        if (req.body.email) {
        updatedFields['user.email'] = req.body.email;
        }
        // Add other fields here
        if (req.body.age) {
        updatedFields.age = req.body.age;
        }

        const sqlParams = [];
        let sqlQuery = 'UPDATE user';
        if(req.body.name){
            sqlQuery += ` JOIN school ON school.school_id = user.school_id 
                        SET user.school_id = (
                        SELECT school_id FROM school WHERE name = ?
                        ),`;
                        sqlParams.push(schname);
            }
        // Loop through the updatedFields object to build the SQL query and collect the corresponding parameter values
        Object.entries(updatedFields).forEach(([key, value], index) => {
        
        //else{
            sqlQuery += ` ${key} = ?`;
            sqlParams.push(value);
            if (index < Object.keys(updatedFields).length - 1) {
                sqlQuery += ',';
            }
        // }
        });

        sqlQuery += ' WHERE user_id = ?';
        sqlParams.push(user_id);

        pool.getConnection((err, conn) => {
        if (err) {
            console.error('Error acquiring database connection:', err);
            return next(err);
        }
        conn.promise()
            .query(sqlQuery, sqlParams)
            .then(() => {
            pool.releaseConnection(conn);
            console.log('SQL Query:', sqlQuery);
            console.log('SQL Parameters:', sqlParams);
            res.redirect('/users/myinfo');
            })
            .catch(err => {
            console.error('Error updating info:', err);
            console.log('SQL Query:', sqlQuery);
            console.log('SQL Parameters:', sqlParams);
            next(err);
            });
        });
    }
    else{
        res.send("You are not authorized to change your info as student.");
    }
  };