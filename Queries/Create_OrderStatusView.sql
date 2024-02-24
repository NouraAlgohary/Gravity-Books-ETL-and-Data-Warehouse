alter VIEW OrderStatusView AS
WITH StatusChanges AS (
    SELECT
        co.order_id,
        oh.status_date,
        os.status_value,
        CONCAT('status_value_', ROW_NUMBER() OVER(PARTITION BY co.order_id ORDER BY oh.status_date)) AS status_column
    FROM cust_order co
    JOIN order_history oh ON co.order_id = oh.order_id
    JOIN order_status os ON oh.status_id = os.status_id
)

SELECT order_id, 
    MAX(CASE WHEN  status_value = 'Order Received' THEN status_value END) AS Order_Received_Status,
    MAX(CASE WHEN status_value = 'Order Received'  THEN status_date END) AS Order_Received_Date,
    MAX(CASE WHEN  status_value = 'Pending Delivery' THEN status_value END) AS Pending_Delivery_Status,
    MAX(CASE WHEN  status_value = 'Pending Delivery' THEN status_date END) AS Pending_Delivery_Date,
    MAX(CASE WHEN  status_value = 'Delivery In Progress' THEN status_value END) AS Delivery_In_Progress_Status,
    MAX(CASE WHEN  status_value = 'Delivery In Progress' THEN status_date END) AS Delivery_In_Progress_Date,
    MAX(CASE WHEN  status_value = 'Delivered' THEN status_value END) AS Delivered_Status,
    MAX(CASE WHEN  status_value = 'Delivered' THEN status_date END) AS Delivered_Date,
    MAX(CASE WHEN  status_value = 'Cancelled' THEN status_value END) AS Cancelled_Status,
    MAX(CASE WHEN  status_value = 'Cancelled' THEN status_date END) AS Cancelled_Date,
    MAX(CASE WHEN  status_value = 'Returned' THEN status_value END) AS Returned_Status,
    MAX(CASE WHEN  status_value = 'Returned' THEN status_date END) AS Returned_Date
    -- Add more columns as needed for more status values and their dates
FROM StatusChanges
GROUP BY order_id;