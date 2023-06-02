SELECT b.isbn, b.title, CONCAT(a.first_name, ' ', a.last_name) AS author_name, c.name AS category, u.user_id
FROM book b
JOIN author a ON b.author_id = a.author_id
JOIN category c ON b.category_id = c.category_id
JOIN user u ON u.school_id = b.school_id 
WHERE b.title LIKE '%search_term%'
   OR c.name LIKE '%search_term%'
   OR u.user_id LIKE '%search_term%'
   OR CONCAT(a.first_name, ' ', a.last_name) LIKE '%search_term%';


