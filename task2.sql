- Step 1: Create and Use Database
Add comment
More actions


CREATE DATABASE LibraryDB;


USE LibraryDB;





-- Step 2: Create Tables


CREATE TABLE Author (


    author_id INT AUTO_INCREMENT PRIMARY KEY,


    name VARCHAR(100) NOT NULL


);





CREATE TABLE Book (


    book_id INT AUTO_INCREMENT PRIMARY KEY,


    title VARCHAR(200) NOT NULL,


    publication_year INT


);





CREATE TABLE BookAuthor (


    book_id INT,


    author_id INT,


    PRIMARY KEY (book_id, author_id),


    FOREIGN KEY (book_id) REFERENCES Book(book_id),


    FOREIGN KEY (author_id) REFERENCES Author(author_id)


);





CREATE TABLE Member (


    member_id INT AUTO_INCREMENT PRIMARY KEY,


    name VARCHAR(100) NOT NULL,


    email VARCHAR(100) UNIQUE


);





CREATE TABLE Borrowing (


    borrow_id INT AUTO_INCREMENT PRIMARY KEY,


    member_id INT,


    book_id INT,


    borrow_date DATE,


    return_date DATE,


    FOREIGN KEY (member_id) REFERENCES Member(member_id),


    FOREIGN KEY (book_id) REFERENCES Book(book_id)


);





-- Step 3: Insert Data into Author


INSERT INTO Author (name) VALUES 


('J.K. Rowling'),


('George Orwell'),


('Jane Austen'),


('Mark Twain');





-- Step 4: Insert Data into Book


INSERT INTO Book (title, publication_year) VALUES 


('Harry Potter and the Sorcerer\'s Stone', 1997),


('1984', 1949),


('Pride and Prejudice', 1813),


('Adventures of Huckleberry Finn', 1884),


('Animal Farm', 1945);





-- Step 5: Insert Data into BookAuthor (Mapping Books to Authors)


INSERT INTO BookAuthor (book_id, author_id) VALUES 


(1, 1),  -- Harry Potter by Rowling


(2, 2),  -- 1984 by Orwell


(3, 3),  -- Pride by Austen


(4, 4),  -- Huck Finn by Twain


(5, 2);  -- Animal Farm by Orwell





-- Step 6: Insert Data into Member


INSERT INTO Member (name, email) VALUES 


('Alice Johnson', 'alice@example.com'),


('Bob Smith', 'bob@example.com'),


('Charlie Davis', NULL);  -- Missing email handled with NULL





-- Step 7: Insert Data into Borrowing


INSERT INTO Borrowing (member_id, book_id, borrow_date, return_date) VALUES 


(1, 1, '2024-06-01', '2024-06-15'),


(2, 3, '2024-06-03', NULL),         -- Book not returned yet


(3, 2, '2024-06-05', '2024-06-12');





-- Update return date for member_id = 2


UPDATE Borrowing 


SET return_date = '2024-06-18' 


WHERE member_id = 2 AND book_id = 3;





-- Delete a member who canceled registration


DELETE FROM Member 


WHERE member_id = 3;