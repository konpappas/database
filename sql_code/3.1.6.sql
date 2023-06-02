SELECT C1.name AS category1, C2.name AS category2, COUNT(*) AS pair_count
FROM Book B
JOIN Category C1 ON B.category_id = C1.category_id
JOIN Category C2 ON B.sec_category_id = C2.category_id
JOIN Borrow Br ON B.isbn = Br.isbn
GROUP BY C1.name, C2.name
ORDER BY pair_count DESC
LIMIT 3;
