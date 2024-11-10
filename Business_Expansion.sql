SELECT 
    u.id AS user_id, 
    u.first_name, 
    u.last_name,
    c.id AS customer_id, 
    c.customer_name, 
    COUNT(con.contact_id) AS contact_count
FROM 
    customer c, 
    user_account u, 
    contact con
WHERE 
    c.id = con.customer_id 
    AND u.id = con.user_account_id
GROUP BY 
    u.id, u.first_name, u.last_name, c.id, c.customer_name
HAVING 
    COUNT(con.contact_id) > 1
ORDER BY 
    u.id ASC;
