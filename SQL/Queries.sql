-- information on the author(s), genre(s), publisher, number of pages, price of a selected book
SELECT Title, Author_name, Genre, Publisher_Name, Number_pages, Price
FROM Book, Author, Genre, Publisher
WHERE Title = '1984' AND ISBN = Book_id AND ISBN = BookId AND Publisher = Email;

-- sales based on Genre
SELECT Genre, Order_num, Quantity_ordered, Price
FROM Genre, Customer_order, Book
WHERE Genre = 'Fiction' AND BookId = B_id AND BookId = ISBN;

-- sales based on Author
SELECT Author_name, Order_num, Quantity_ordered, Price
FROM Author, Customer_order, Book
WHERE Author_name = 'Dr. Seuss' AND Book_id = B_id AND Book_id = ISBN;

