SELECT u.user_id, u.first_name, u.last_name, c.name, AVG(r.rating) AS average_rating
FROM user u
JOIN borrow bo ON u.user_id = bo.user_id
JOIN book b ON bo.isbn = b.isbn
JOIN review r ON bo.isbn = r.isbn
JOIN category c ON b.category_id = c.category_id
GROUP BY u.user_id, u.first_name, u.last_name, b.category_id;
