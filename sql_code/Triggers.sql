-- ------------- TRIGGERS -------------------------------

-- Setting event to delete reservations after one week 
CREATE EVENT IF NOT EXISTS `delete_reservations_event`
ON SCHEDULE
  EVERY 1 DAY_HOUR 
  ON COMPLETION PRESERVE
  COMMENT 'Clean up reservations.'
  DO
    DELETE FROM reservation
    WHERE reservation_date < DATE_SUB(NOW(), INTERVAL 7 DAY)

-- ------------------ CHECK rules of  reservations   -------------------
DELIMITER $
CREATE TRIGGER chk_num_of_reservations BEFORE INSERT ON reservation
FOR EACH ROW 
BEGIN 
	IF (new.user_id = (SELECT r.user_id from reservations r INNER JOIN user u ON u.user_id = r.user_id INNER JOIN book b ON  b.isbn = r.isbn
    WHERE u.user_type = "student" AND r.isbn = new.isbn  GROUP BY r.user_id HAVING COUNT(*)= 2) AND DATEDIFF(new.reservation_date,CURDATE()) <7 ) THEN 
      SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on reservations failed - A student can only make 2 reservations a week.';
    END IF;
    IF (new.user_id = (SELECT r.user_id from reservation r INNER JOIN user u ON u.user_id = r.user_id INNER JOIN book b ON  b.isbn = r.isbn
    WHERE u.user_type = "professor" AND r.isbn = new.isbn  GROUP BY r.user_id HAVING COUNT(*)= 1) AND DATEDIFF(new.reservation_date,CURDATE()) <=7)  THEN 
      SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on reservations failed - A professor can only make 1 reservation a week.';
    END IF;
 IF(new.user_id = (select user_id from borrow WHERE datediff(CURDATE(), returning_date)>1  ) )  THEN 
 SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on reservations failed - A user cannot make reservation if a book has not been returned on time.';
    END IF;
IF (new.isbn = (SELECT isbn FROM borrow   WHERE user_id =  new.user_id AND isbn=new.isbn) ) THEN 
	SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on reservations failed - A user cannot make reservation if   the same user has already borrowed the title.';
    END IF;
END$  
DELIMITER ; 

-- ------------------ CHECK rules of  borrowings   -------------------
DELIMITER $ 
CREATE TRIGGER chk_borrowings BEFORE INSERT ON borrow
FOR EACH ROW 
BEGIN 
IF (new.user_id = (SELECT bo.user_id from borrow bo INNER JOIN user u ON u.user_id = bo.user_id INNER JOIN book b ON  b.isbn = bo.isbn
    WHERE u.user_type = "student"   and u.user_id=new.user_id   AND DATEDIFF(bo.borrowing_date,CURDATE()) <7 GROUP BY bo.user_id HAVING COUNT(*)= 2)  ) THEN 
      SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on  borrowings failed - A student can only borrow 2 books a week.';
    END IF;


    
IF (new.user_id = (SELECT bo.user_id from borrow bo INNER JOIN user u ON u.user_id = bo.user_id INNER JOIN book b ON  b.isbn = bo.isbn
    WHERE u.user_type = "professor"   and u.user_id=new.user_id   AND DATEDIFF(bo.borrowing_date,CURDATE()) <7 GROUP BY bo.user_id HAVING COUNT(*)= 1)  ) THEN 
      SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on  borrowings failed - A professor can only borrow 1 book a week.';
    END IF;
    
IF (new.user_id = (SELECT user_id from borrow WHERE isbn= new.isbn) AND DATEDIFF(new.borrowing_date,CURDATE()) > 7 ) THEN
	 SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on  borrowings failed - A user cannot borrow a book  if returns are delayed or still open.';
	 END IF;
     
IF (new.isbn = (SELECT isbn FROM book WHERE available_copies = 0 AND isbn = new.isbn)) THEN
	 SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on  borrowings failed - A user cannot borrow a book  if there is no  available copie of book.';
	 END IF;
END$ 
DELIMITER ; 

-- ---------------decrease available copies of a book when it gets borrowed  --------------------------------------
DELIMITER $ 
CREATE TRIGGER decrease_avail_copies AFTER INSERT ON borrow
FOR EACH ROW 
BEGIN 
	IF (DATEDIFF(returning_date,CURDATE()) > 7) THEN 
		UPDATE book b SET b.available_copies = b.available_copies -1 WHERE isbn = NEW.isbn;
	END IF;

END$ 
DELIMITER ; 





