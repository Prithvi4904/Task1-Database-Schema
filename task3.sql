-- 1. Select all books
SELECT * FROM Book;

-- 2. Select all members with non-null emails
SELECT * FROM Member
WHERE email IS NOT NULL;

-- 3. Select all books published after 1950
SELECT * FROM Book
WHERE publication_year > 1950;

-- 4. Select all books written by 'George Orwell'
SELECT b.title
FROM Book b
JOIN BookAuthor ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id
WHERE a.name = 'George Orwell';

-- 5. Select borrowings that have not yet been returned
SELECT * FROM Borrowing
WHERE return_date IS NULL;

-- 6. List all members ordered alphabetically
SELECT * FROM Member
ORDER BY name ASC;

-- 7. Get the 2 most recently borrowed books
SELECT b.title, br.borrow_date
FROM Book b
JOIN Borrowing br ON b.book_id = br.book_id
ORDER BY br.borrow_date DESC
LIMIT 2;

-- 8. List books and authors (many-to-many relationship)
SELECT b.title, a.name AS author_name
FROM Book b
JOIN BookAuthor ba ON b.book_id = ba.book_id
JOIN Author a ON ba.author_id = a.author_id;

-- 9. Show borrowing history of 'Alice Johnson'
SELECT b.title, br.borrow_date, br.return_date
FROM Borrowing br
JOIN Book b ON br.book_id = b.book_id
JOIN Member m ON br.member_id = m.member_id
WHERE m.name = 'Alice Johnson';

-- 10. Count number of books borrowed per member
SELECT m.name, COUNT(br.borrow_id) AS total_borrowed
FROM Member m
LEFT JOIN Borrowing br ON m.member_id = br.member_id
GROUP BY m.name;
