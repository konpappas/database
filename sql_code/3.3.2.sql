SELECT b.title, bo.borrowing_date, bo.returning_date
FROM book b
JOIN borrow bo ON b.isbn = bo.isbn
JOIN user u ON bo.user_id = u.user_id
WHERE u.user_id = 'user_id';
