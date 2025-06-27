-- 11. Sum of all borrowings across all members
SELECT SUM(borrow_count) AS total_borrowed_books
FROM (
  SELECT COUNT(*) AS borrow_count
  FROM Borrowing
  GROUP BY member_id
) AS member_borrow_counts;

-- 12. Average number of borrowings per member
SELECT AVG(borrow_count) AS average_borrowings_per_member
FROM (
  SELECT COUNT(*) AS borrow_count
  FROM Borrowing
  GROUP BY member_id
) AS member_borrow_counts;

-- 13. Count borrowings per book
SELECT b.title, COUNT(br.borrow_id) AS times_borrowed
FROM Book b
LEFT JOIN Borrowing br ON b.book_id = br.book_id
GROUP BY b.title;

-- 14. Number of distinct members who have borrowed books
SELECT COUNT(DISTINCT member_id) AS total_members_who_borrowed
FROM Borrowing;

-- 15. Borrowing summary per member with min/max dates
SELECT m.name, COUNT(br.borrow_id) AS total_borrowed,
       MIN(br.borrow_date) AS first_borrow_date,
       MAX(br.borrow_date) AS last_borrow_date
FROM Member m
LEFT JOIN Borrowing br ON m.member_id = br.member_id
GROUP BY m.name;
