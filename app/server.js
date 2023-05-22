
//Hello!

//Test

//const connection = require('./utils/database');
/*app.get('/', function(req, res) {
    let sql = "SELECT * FROM EMPLOYEE_INFO";
    connection.query(sql, function(err, results){
        if (err) throw err;
        res.send(results);
    });
});*/

const app = require('./app');

//const chalk = require("chalk");

const port = process.env.SERVER_PORT || 3000;

app.listen(port, function(){
    console.log(`🚀 Server running on port ${port}!`);
    /*  connection.connect(function(err){
        if(err) throw err;
        console.log('Database connected!');
    })*/
});