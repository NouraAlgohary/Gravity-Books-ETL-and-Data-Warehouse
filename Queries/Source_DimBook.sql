SELECT
    b.book_id,
    b.title,
    b.isbn13,
    bl.language_id AS language_id_bk,
    bl.language_code,
    bl.language_name,
    b.num_pages,
    b.publisher_id AS publisher_id_bk,
    b.publication_date,
    p.publisher_name,
    ba.author_id AS author_id_bk,
    a.author_name
FROM
    dbo.book b
LEFT JOIN
    dbo.book_language bl ON b.language_id = bl.language_id
LEFT JOIN
    dbo.publisher p ON b.publisher_id = p.publisher_id
LEFT JOIN

    dbo.book_author ba ON b.book_id = ba.book_id
LEFT JOIN
    dbo.author a ON ba.author_id = a.author_id

ORDER BY b.book_id;