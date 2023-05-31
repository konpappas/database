SELECT u.first_name, u.last_name, count(b.borrow_id) AS number_of_books
from user u 
join borrow b on b.user_id=u.user_id
where age < 40 and user_type = 'professor'
group by b.user_id
order by number_of_books desc;