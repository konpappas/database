//const connection = require('./utils/database');
/*app.get('/', function(req, res) {
    let sql = "SELECT * FROM EMPLOYEE_INFO";
    connection.query(sql, function(err, results){
        if (err) throw err;
        res.send(results);
    });
});*/

const app = require('./app');


const port = process.env.SERVER_PORT || 3000;

app.listen(port, ()=>{
    console.log(`🚀 Server running on port ${port}!`);
});
