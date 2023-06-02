select DISTINCT a.first_name, a.last_name
FROM book b
join author a ON a.author_id = b.author_id
join category c ON c.category_id = b.category_id
where c.name = 'Horror'
Union
select distinct u.first_name,u.last_name
FROM borrow br
join user u ON u.user_id = br.user_id
join book b on b.isbn = br.isbn
join category c ON c.category_id = b.category_id
where c.name = 'Horror' and u.user_type = 'Professor' and br.borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH);