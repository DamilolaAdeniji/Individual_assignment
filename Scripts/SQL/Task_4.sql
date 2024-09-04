-- List of order IDs where either gloss_qty or poster_qty is greater than 4000. 

select distinct id 
from orders
where gloss_qty > 4000 or poster_qty > 4000


-- List of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
select * 
from orders
where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000)


-- all the company names that start with a 'C' or 'W', and where the primary contact contains 'ana' or 'Ana', but does not contain 'eana'.
select name 
from accounts
where (name ilike 'c%' or name ilike 'w%') and primary_poc ilike '%ana%' and primary_poc not ilike '%eana%' 


-- a table that shows the region for each sales rep along with their associated accounts. 
select a.name "sales_rep_name", b.name "account_name", c.name "region_name"
from sales_reps a
left join accounts b on a.id = b.sales_rep_id
left join region c on a.region_id = c.id