CREATE OR REPLACE VIEW book_summary AS 
SELECT title, subtitle, author, publisher FROM books;

GRANT SELECT ON book_summary TO view_user;