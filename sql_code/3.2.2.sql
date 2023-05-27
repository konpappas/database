SELECT u.first_name, u.last_name
FROM borrow b
JOIN user u ON b.user_id = u.user_id
WHERE DATEDIFF(b.returning_date, b.borrowing_date) > 7;

