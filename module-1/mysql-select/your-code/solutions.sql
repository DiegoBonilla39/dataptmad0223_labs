--Challenge 1 - Who Have Published What At Where?
SELECT 
    au.au_id AS 'AUTHOR ID', 
    au.au_lname AS 'LAST NAME', 
    au.au_fname AS 'FIRST NAME', 
    ti.title AS 'TITLE', 
    pu.pub_name AS 'PUBLISHER'
FROM 
    authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    INNER JOIN titles AS ti ON ta.title_id = ti.title_id 
    INNER JOIN publishers AS pu ON ti.pub_id = pu.pub_id 

--Challenge 2 - Who Have Published How Many At Where?    
SELECT 
    au.au_id AS 'AUTHOR ID', 
    au.au_lname AS 'LAST NAME', 
    au.au_fname AS 'FIRST NAME',  
    pu.pub_name AS 'PUBLISHER',
    COUNT(ti.title) AS 'TITLE'
FROM 
    authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    INNER JOIN titles AS ti ON ta.title_id = ti.title_id 
    INNER JOIN publishers AS pu ON ti.pub_id = pu.pub_id
GROUP BY au.au_id
ORDER BY 5 DESC

--Challenge 3 - Best Selling Authors
SELECT
    au.au_id AS 'AUTHOR ID', 
    au.au_lname AS 'LAST NAME', 
    au.au_fname AS 'FIRST NAME',  
    SUM(sa.qty) AS 'TOTAL'
FROM 
    authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    INNER JOIN titles AS ti ON ta.title_id = ti.title_id 
    INNER JOIN sales AS sa ON sa.title_id = ti.title_id
GROUP BY au.au_id
ORDER BY 4 DESC
LIMIT 3

--Challenge 4 - Best Selling Authors Ranking
SELECT
    au.au_id AS 'AUTHOR ID', 
    au.au_lname AS 'LAST NAME', 
    au.au_fname AS 'FIRST NAME',  
    IFNULL(SUM(sa.qty), 0) AS 'TOTAL'
FROM 
    authors AS au
    FULL JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS ti ON ta.title_id = ti.title_id 
    LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
GROUP BY au.au_id
ORDER BY 4 DESC