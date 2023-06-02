SELECT b.title, CONCAT(a.first_name, ' ', a.last_name) AS author_name, b.available_copies, c.name
FROM book b
JOIN author a ON b.author_id = a.author_id
JOIN category c ON b.category_id = c.category_id
WHERE b.title LIKE '%search_term%'
   OR c.name LIKE '%search_term%'
   OR CONCAT(a.first_name, ' ', a.last_name) LIKE '%search_term%';

