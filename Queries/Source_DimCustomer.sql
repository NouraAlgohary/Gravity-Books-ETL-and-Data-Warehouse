SELECT c.*, a.*, a_s.*,  cn.country_name
FROM customer c
LEFT JOIN customer_address ca ON c.customer_id = ca.customer_id
LEFT JOIN address a ON ca.address_id = a.address_id
LEFT JOIN country cn ON a.country_id = cn.country_id
LEFT JOIN address_status a_s ON ca.status_id = a_s.status_id;