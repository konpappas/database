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
)
