const bcrypt = require('bcrypt');
var  sweetalert = require('sweetalert2');
const { check, validationResult } = require('express-validator');

const { pool } = require('../utils/database');

exports.postlogin = async(req, res) => {

            const { username, password } = req.body;
            pool.getConnection((err, conn) =>{
            conn.query('SELECT * FROM User WHERE username = ? and password = ?', [username, password], function(error,results, fields){
            
            pool.releaseConnection(conn);
            if (results.length > 0){
                
                req.session.loggedin = true ; 
                req.session.username = username;
                res.cookie('username' , username);
                
                const user = results[0]; // Assuming the first row of the results contains the user details
                const role = user.user_type;
                //const school = user.school_id;
                //const role = req.session.user_type;
                req.session.schoolId = user.school_id;// Store the school ID in session
                req.session.userId= user.user_id;
                const approved = user.approved;
                if(role === 'administrator')
                        res.redirect('/admin_layout');
                        else if (role === 'library_operator' && approved===1)
                            res.redirect('/operator_layout');
                            else if(role === 'student' && approved===1)
                                 res.redirect('/student_layout');
                                 else if(role === 'professor' && approved===1)
                                     res.redirect('/prof_layout');
               
            }else{
                //res.send('Incorrect username / password');
                res.redirect('/login');
            }
            res.end();
        })
    })
}
