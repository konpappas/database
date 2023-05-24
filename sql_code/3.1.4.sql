select a.first_name, a.last_name
from book b 
join author a on a.author_id = b.author_id
left outer join borrow br on b.isbn = br.isbn
group by b.author_id
having count(borrow_id) = 0;