SELECT COUNT(b.borrow_id), u.school_id 
FROM borrow b
JOIN user u ON b.user_id = u.user_id
WHERE MONTH(b.borrowing_date) = 4
GROUP BY u.school_id
ORDER BY u.school_id;
