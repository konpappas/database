const { pool } = require('../utils/database');

exports.getReset = (req,res,next)=>{

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    res.render('resetpassword.ejs',{
        pageTitle: "Reset Password"
    });
}

exports.postReset = (req, res, next) => {
  const { username, password, newPassword} = req.body;
  pool.getConnection((err, conn) =>{
    // Check if the current password is correct
        const query = 'SELECT * FROM User WHERE username = ? and password = ?';
        conn.query(query, [username, password, newPassword], (error,results)=>{
       // pool.releaseConnection(conn);
        if (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
        }
        if (results.length == 0) {
            res.status(401).json({ error: 'Invalid current password' });
           //res.send("please verify your email");
           return;
        }
        })
    //})


//exports.postupdateReset = (req, res, next) => {
  //  const { username, newPassword } = req.body;
   // pool.getConnection((err, conn) =>{
    const updateQuery = 'UPDATE User SET password = ? WHERE username = ?';
    conn.query(updateQuery, [newPassword, username], (err, results) => {
        pool.releaseConnection(conn);
          if (err) {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
            return;
          }

          res.status(200).json({ message: 'Password changed successfully' });
         // res.redirect('/login');
        });
      })
}
