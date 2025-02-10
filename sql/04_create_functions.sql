CREATE OR REPLACE FUNCTION get_books_by_author(author_name VARCHAR)
RETURNS TABLE (id INT, title VARCHAR, subtitle VARCHAR, publisher VARCHAR) AS $$
BEGIN
    RETURN QUERY 
    SELECT id, title, subtitle, publisher FROM books WHERE author = author_name;
END;
$$ LANGUAGE plpgsql;