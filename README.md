# School Library Database Management
Semester Project for the ECE NTUA course "Databases".

# Authors:

Georgia Manifava

Giannis Iliopoulos

Konstantinos Pappas

# Dependencies:
1. NodeJS
2. MySQL for Windows

# NodeJS Dependencies:

1. [express](https://www.npmjs.com/package/express) 
2. [mysql2](https://www.npmjs.com/package/mysql2) 
3. [ejs](https://www.npmjs.com/package/ejs) 
4. [faker](https://www.npmjs.com/package/faker/v/5.5.3) 
5. [express-session](https://www.npmjs.com/package/express-session)
6. [connect-flash](https://www.npmjs.com/package/connect-flash)

## Βήματα για εγκατάσταση εφαρμογής
1. Ανοίγουμε στο MySQL Workbench τα sql scipts που είναι μέσα στον φάκελο sql_code. Δημιουργούμε τη βάση και κάνουμε insert τα δεδομένα στους πίνακες.
2. Eπεξεργαζόμαστε το .env.localhost.txt εντός του φακέλου app, σύμφωνα με τις οδηγίες παρακάτω στην παράγραφο ```custom-env```.
3. Στη γραμμή εντολών κατευθυνόμαστε στο directory του app με cd command.
4. Τρέχουμε την εντολή npm install για να εγκαταστήσουμε όλα τα dependencies.
5. Kάνουμε npm start για την εκκίνηση του Server.
6. Eπισκεπτόμαστε την σελίδα http://localhost:PORT/, όπου PORT ό,τι έχουμε γράψει στο SERVER_PORT στο .env.localhost. 
7.Παρατήρηση: προκειμένου να μπορεί να κάνει backup/restore o administrator, χρειάζεται να έχετε επιβεβαιώσει ότι υπάρχει το MySQL\MySQL Server X.X\bin Directory στο PATH στις μεταβλητές περιβάλλοντος του συστήματός σας. Εάν δεν υπάρχει, χρειάζεται να το προσθέσετε για τη συγκεκριμένη λειτουργία του administartor.

### custom-env 
1. Ανοίγουμε το .env.localhost.txt
2. Aλλάζουμε το περιεχόμενο του για να δουλεύει στο σύστημά μας

 ```.env.localhost``` content:
```
SERVER_PORT=3000
DB_HOST=localhost
DB_PORT=3306
DB_USER=dbuser
DB_PASS=dbpass
DB=db-name
```
3. Κάνουμε Save us, αφαιρώντας την κατάληξη .txt και επιλέγουμε All files στο Save as types.
