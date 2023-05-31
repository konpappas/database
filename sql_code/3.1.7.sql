select a.first_name, a.last_name
from book b 
join author a on a.author_id = b.author_id
group by b.author_id
having count(isbn) <= (SELECT MAX(book_count) - 5
                        FROM (SELECT COUNT(isbn) AS book_count
                              FROM book
                              GROUP BY author_id) AS counts);