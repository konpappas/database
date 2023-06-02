SELECT u.first_name, u.last_name
FROM borrow b
JOIN user u ON b.user_id = u.user_id
WHERE DATEDIFF(CURDATE(), b.returning_date) > 7;

