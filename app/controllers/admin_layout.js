const { pool } = require('../utils/database');
const { exec } = require('child_process');

const user = process.env.DB_USER;
const database = process.env.DB;

const pwd = process.env.DB_PASS;


exports.getLanding = (req, res, next) => {
    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    res.render('admin_layout.ejs', {
        pageTitle: "Administrator Landing Page"
    });
}

exports.getAdminOperator = (req, res, next) =>{
    res.render('operators.ejs',{
        pageTitle: "Operator Approval"
    })
}

exports.getSchools = (req, res, next) => {
    res.render('schools.ejs',{
        pageTitle: "Schools View"
    })
}

exports.getAddSchool = (req, res, next) => {
    res.render('add-schools.ejs',{
        pageTitle: "Insert a school library"
    })
}


  exports.getBackUp = (req, res, next) => {
   // Code to create a backup of the database
    // You can use the child_process module to execute a backup command
    
    exec(`mysqldump -u ${user} --password=${pwd} ${database} > backup.sql`, (error, stdout, stderr) => {
      if (error) {
          console.error(`Backup error: ${error.message}`);
          res.status(500).send('Backup failed');
          return;
      }
      console.log('Backup created');
      res.status(200).send('Backup created');
  });
  }

  exports.restoreBackUp = (req, res, next) => {
        // Code to restore the database from a backup
    // You can use the child_process module to execute a restore command
    
    exec(`mysql -u ${user} --password=${pwd} ${database} < backup.sql`, (error, stdout, stderr) => {
      if (error) {
          console.error(`Restore error: ${error.message}`);
          res.status(500).send('Restore failed');
          return;
      }
      console.log('Database restored');
      res.status(200).send('Database restored');
  });
  } 

  exports.getBorrowSchool = (req, res, next) => {
    res.render('borrowschool.ejs',{
        pageTitle: "View borrows per school"
    })
  }
  
exports.getBorrowYoung = (req, res, next) => {
    res.render('borrowsyoung.ejs',{
        pageTitle: "View young professors with descending order according to borrow count"
    })
  }

  exports.getAuthor5Books = (req, res, next) => {
    res.render('authorsbooks.ejs',{
        pageTitle: "View QUERY 3.1.7"
    })
  }

  exports.getCategChoice = (req, res, next) => {
    res.render('categauthorprof.ejs',{
        pageTitle: "View QUERY 3.1.2"
    })
  }

  exports.getAuthorsNoBorrow = (req, res, next) => {
    res.render('authornoborrow.ejs',{
        pageTitle: "View QUERY 3.1.4"
    })
  }

  exports.getsameBorrow = (req, res, next) => {
    res.render('sameborrow.ejs',{
        pageTitle: "View QUERY 3.1.5"
    })
  }

  exports.getTop3Cat = (req, res, next) => {
    res.render('top3cat.ejs',{
        pageTitle: "View QUERY 3.1.6"
    })
  }
