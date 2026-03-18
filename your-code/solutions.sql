use publications;

-- Challenge 1:
SELECT au.au_id as 'AUTHOR ID', au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_name as 'PUBLISHER'
FROM titles t 
join titleauthor att on t.title_id=att.title_id
join authors au on au.au_id=att.au_id
join publishers p on t.pub_id=p.pub_id;

-- Challenge 2:
SELECT au.au_id as 'AUTHOR ID', au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME', p.pub_name as 'PUBLISHER', count(t.title) as 'TITLE COUNT'
FROM titles t 
join titleauthor att on t.title_id=att.title_id
join authors au on au.au_id=att.au_id
join publishers p on t.pub_id=p.pub_id
group by au.au_id, p.pub_name;

-- Challenge 3:
SELECT au.au_id as 'AUTHOR ID', au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME', sum(s.qty) as TOTAL
FROM titles t 
join titleauthor att on t.title_id=att.title_id
join authors au on au.au_id=att.au_id
join sales s on t.title_id=s.title_id
group by au.au_id
ORDER BY TOTAL desc
LIMIT 3;

-- Challenge 4:
SELECT au.au_id as 'AUTHOR ID', au.au_lname as 'LAST NAME', au.au_fname as 'FIRST NAME', coalesce(SUM(s.qty), 0) as TOTAL
FROM authors au
LEFT JOIN titleauthor att ON au.au_id = att.au_id
LEFT JOIN titles t ON t.title_id = att.title_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname
ORDER BY TOTAL desc;
