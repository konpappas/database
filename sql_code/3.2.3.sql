SELECT u.user_id, u.first_name, u.last_name, b.category_id, AVG(r.rating) AS average_rating
FROM user u
JOIN borrow bo ON u.user_id = bo.user_id
JOIN book b ON bo.isbn = b.isbn
JOIN review r ON bo.isbn = r.isbn
GROUP BY u.user_id, u.first_name, u.last_name, b.category_id;
