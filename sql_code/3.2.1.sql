SELECT b.title, CONCAT(a.first_name, ' ', a.last_name) AS author_name, b.available_copies, b.category_id
FROM book b
JOIN author a ON b.author_id = a.author_id
WHERE b.title LIKE '%search_term%'
   OR b.category_id LIKE '%search_term%'
   OR CONCAT(a.first_name, ' ', a.last_name) LIKE '%search_term%';

