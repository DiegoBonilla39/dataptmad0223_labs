--solutions_lab_advanced

--Challenge 1 - Most Profiting Authors

--Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT
    ti.title_id AS 'TITLE ID',
	au.au_id AS 'AUTHOR ID',
	IFNULL((ti.advance*ta.royaltyper)/100,0) AS 'ADVANCE',
	IFNULL(((ti.price*sa.qty*ti.royalty)/100)*(ta.royaltyper/100),0) AS 'ROYALTY'
FROM 
    authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS ti ON ta.title_id = ti.title_id 
    LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
    LEFT JOIN roysched AS ro ON sa.title_id = ro.title_id

--Step 2: Aggregate the total royalties for each title and author
SELECT
	sub.'TITLE ID',
	sub.'AUTHOR ID',
	IFNULL(SUM(sub.ROYALTY),0) AS 'TOTAL ROYALTY'
FROM(SELECT
    ti.title_id AS 'TITLE ID',
	au.au_id AS 'AUTHOR ID',
	IFNULL((ti.advance*ta.royaltyper)/100,0) AS 'ADVANCE',
	IFNULL(((ti.price*sa.qty*ti.royalty)/100)*(ta.royaltyper/100),0) AS 'ROYALTY'
FROM 
    authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS ti ON ta.title_id = ti.title_id 
    LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
    LEFT JOIN roysched AS ro ON sa.title_id = ro.title_id
	) AS sub
 GROUP BY sub.'TITLE ID', sub.'AUTHOR ID'
 ORDER BY 3 DESC

--Step 3: Calculate the total profits of each author
SELECT
	sub.'AUTHOR ID',
	IFNULL(ROUND(SUM(sub.'ADVANCE'+sub.'ROYALTY'),0),0) AS 'PROFIT'
FROM(SELECT
    ti.title_id AS 'TITLE ID',
	au.au_id AS 'AUTHOR ID',
	IFNULL((ti.advance*ta.royaltyper)/100,0) AS 'ADVANCE',
	IFNULL(((ti.price*sa.qty*ti.royalty)/100)*(ta.royaltyper/100),0) AS 'ROYALTY'
FROM 
    authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS ti ON ta.title_id = ti.title_id 
    LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
    LEFT JOIN roysched AS ro ON sa.title_id = ro.title_id
	) AS sub
 GROUP BY sub.'AUTHOR ID'
 ORDER BY 2 DESC

--Challenge 2 - Alternative Solution
--Creating MySQL temporary tables and query the temporary tables in the subsequent steps.

--Step 1: Temporary table with royalty of each sale for each author and the advance for each author and publication

CREATE TEMP TABLE tt AS
SELECT
    ti.title_id AS 'TITLE ID',
	au.au_id AS 'AUTHOR ID',
	IFNULL((ti.advance*ta.royaltyper)/100,0) AS 'ADVANCE',
	IFNULL(((ti.price*sa.qty*ti.royalty)/100)*(ta.royaltyper/100),0) AS 'ROYALTY'
FROM 
    authors AS au
    LEFT JOIN titleauthor AS ta ON au.au_id = ta.au_id
    LEFT JOIN titles AS ti ON ta.title_id = ti.title_id 
    LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
    LEFT JOIN roysched AS ro ON sa.title_id = ro.title_id;
   
--Step 2: Aggregate the total royalties for each title and author
   
SELECT
	tt.'TITLE ID',
	tt.'AUTHOR ID',
	IFNULL(SUM(tt.ROYALTY),0) AS 'TOTAL ROYALTY'
FROM tt
 GROUP BY tt.'TITLE ID', tt.'AUTHOR ID'
 ORDER BY 3 DESC;

--Step 3: Calculate the total profits of each author
SELECT
	tt.'AUTHOR ID',
	IFNULL(ROUND(SUM(tt.'ADVANCE'+tt.'ROYALTY'),0),0) AS 'PROFIT'
FROM tt
 GROUP BY tt.'AUTHOR ID'
 ORDER BY 2 DESC;

--Challenge 3 - Alternative Solution
--Create a permanent table named most_profiting_authors to hold the data about the most profiting authors

CREATE TABLE most_profiting_authors(
    'AUTHOR ID' VARCHAR,
    'PROFIT' INTEGER
);

INSERT INTO most_profiting_authors('AUTHOR ID', 'PROFIT')
SELECT
    tt.'AUTHOR ID',
    IFNULL(ROUND(SUM(tt.'ADVANCE'+tt.'ROYALTY'),0),0) AS 'PROFIT'
FROM tt
GROUP BY tt.'AUTHOR ID'
ORDER BY 2 DESC;

SELECT * FROM most_profiting_authors


