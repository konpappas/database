CREATE DATABASE SchoolLibrary;

USE SchoolLibrary;


CREATE TABLE School (
    school_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    director_name VARCHAR(50) NOT NULL,
    library_operator_name VARCHAR(50) NOT NULL
);

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    user_type ENUM('administrator', 'library_operator', 'student', 'professor') NOT NULL,
    school_id INT NOT NULL,
    approved BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE Book (
    isbn VARCHAR(50) PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    pages INT NOT NULL,
    summary TEXT NOT NULL,
    available_copies INT NOT NULL,
    image VARCHAR(255),
    language VARCHAR(50),
    keywords VARCHAR(100),
    category_id INT NOT NULL,
    author_id INT NOT NULL
);

CREATE TABLE Reservation (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_date DATE NOT NULL,
    expiration_date DATE NOT NULL,
    user_id INT NOT NULL,
    isbn VARCHAR(50) NOT NULL
);

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    review_text TEXT,
    rating DECIMAL(2,1) NOT NULL CHECK (rating >= 0.0 AND rating <= 5.0),
    user_id INT NOT NULL,
    isbn VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL,
    approved BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE Borrow (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    borrowing_date DATE NOT NULL,
    returning_date DATE NOT NULL,
    user_id INT NOT NULL,
    isbn VARCHAR(50) NOT NULL
);

CREATE TABLE Category (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

ALTER TABLE Reservation
ADD CONSTRAINT chk_reservation_dates CHECK (expiration_date > reservation_date),
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (isbn) REFERENCES Book(isbn);

ALTER TABLE Borrow
ADD CONSTRAINT chk_borrow_dates CHECK (returning_date > borrowing_date),
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (isbn) REFERENCES Book(isbn);

ALTER TABLE Review
ADD FOREIGN KEY (user_id) REFERENCES User(user_id),
ADD FOREIGN KEY (isbn) REFERENCES Book(isbn);

ALTER TABLE Book
ADD CONSTRAINT available_copies CHECK (available_copies >= 0),
ADD FOREIGN KEY (category_id) REFERENCES Category(category_id),
ADD FOREIGN KEY (author_id) REFERENCES Author(author_id);

ALTER TABLE User
ADD FOREIGN KEY (school_id) REFERENCES School(school_id),
ADD CONSTRAINT approved_user CHECK (user_type = 'administrator' OR (user_type <> 'administrator' AND approved = 1));