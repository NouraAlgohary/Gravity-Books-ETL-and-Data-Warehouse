SELECT 
 co.order_id AS order_id_BK,
 co.order_date,
  ol.line_id As line_id_BK,
  bo.book_id AS book_id_BK,
  co.customer_id AS Customer_id,
  co.shipping_method_id AS method_id,
  shi.cost,
  ol.Price,
  osv.*

FROM
    dbo.cust_order AS co

RIGHT JOIN   dbo.order_line AS ol 
ON  co.order_id = ol.order_id

LEFT JOIN
    OrderStatusView AS osv 
ON co.order_id = osv.order_id
Join
    book AS bo
ON bo.book_id = ol.book_id
Join
	shipping_method as shi
on  shi.method_id = co.shipping_method_id

--where osv.order_id >?      
ORDER BY ol.line_id;