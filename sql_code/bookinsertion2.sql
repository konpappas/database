UPDATE book
set school_id = 1
WHERE isbn IN (select isbn
		from borrow br
        join user u on u.user_id = br.user_id
        where u.school_id = 1);
        
UPDATE book
set school_id = 2
WHERE isbn IN (select isbn
		from borrow br
        join user u on u.user_id = br.user_id
        where u.school_id = 2);
        
UPDATE book
set school_id = 3
WHERE isbn IN (select isbn
		from borrow br
        join user u on u.user_id = br.user_id
        where u.school_id = 3);
        
UPDATE book
set school_id = 4
WHERE isbn IN (select isbn
		from borrow br
        join user u on u.user_id = br.user_id
        where u.school_id = 4);
        
UPDATE book
set school_id = 5
WHERE isbn IN (select isbn
		from borrow br
        join user u on u.user_id = br.user_id
        where u.school_id = 5);
        
UPDATE book
SET school_id = FLOOR(RAND() * 5) + 1
WHERE school_id = 0;
