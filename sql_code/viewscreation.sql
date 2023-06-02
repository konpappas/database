CREATE VIEW authors_and_professors AS
SELECT DISTINCT a.first_name, a.last_name
FROM book b
JOIN author a ON a.author_id = b.author_id
JOIN category c ON c.category_id = b.category_id
WHERE c.name = 'Horror'
UNION
SELECT DISTINCT u.first_name, u.last_name
FROM borrow br
JOIN user u ON u.user_id = br.user_id
JOIN book b ON b.isbn = br.isbn
JOIN category c ON c.category_id = b.category_id
WHERE c.name = 'Horror' AND u.user_type = 'Professor' AND br.borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH);

CREATE VIEW operators_comparison AS
SELECT U.first_name, U.last_name, COUNT(*) AS loan_count
FROM Borrow B
JOIN User U ON B.operator_id = U.user_id
WHERE B.borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY B.operator_id
HAVING loan_count > 20
AND loan_count = (
    SELECT COUNT(*) AS same_loan_count
    FROM Borrow
    WHERE borrowing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
    GROUP BY operator_id
    HAVING operator_id = B.operator_id
);
