UPDATE [dbo].[Meta_Control_Fact_Order_Load]
SET last_modified_id_bk = ?
, last_load_date = ?
WHERE orderDetails = "orderDetails";