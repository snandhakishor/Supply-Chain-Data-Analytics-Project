
-- Creating fact table for shipment details
create table fact_shipment (order_id int, shipping_mode varchar(50),
Delivery_status varchar(100),
shipping_days_real int, shipping_days_scheduled int, 
late_delivery_risk int, Order_Date timestamp,
ship_date timestamp);

-- populating fact table with relevant data from denormalized table
insert into fact_shipment (order_id, shipping_mode, delivery_status, shipping_days_real,
shipping_days_scheduled, late_delivery_risk, order_date, ship_date) 
select distinct "Order Id", "Shipping Mode", "Delivery Status", "Days for shipping (real)",
"Days for shipment (scheduled)", "Late_delivery_risk", "order date (DateOrders)",
"shipping date (DateOrders)" 
from denormalized;

-- altering data types of date columns to text for consistency
alter table fact_shipment 
alter column order_date type text, 
alter column ship_date type text;

-- creating fact table for sales details
create table fact_sales (sales_id int, Quantity int, Sales float,
Price float, Discount float, Profit_per_order
float, Discount_rate float, Order_item_total float, profit_ratio float, benefit_per_order float,
customer_id int, product_id int, order_id int);
select * from fact_sales;

-- populating fact sales with relevant data from denormalized table
insert into fact_sales (sales_id, Quantity, Sales, Price, Discount, Profit_per_order,
Discount_rate, Order_item_total, profit_ratio, 
benefit_per_order, customer_id, product_id, order_id) 
select distinct "Order Item Id", "Order Item Quantity",
"Sales", "Order Item Product Price",
"Order Item Discount", "Order Profit Per Order", 
"Order Item Discount Rate", "Order Item Total", "Order Item Profit Ratio", 
"Benefit per order", "Customer Id", 
"Product Card Id", "Order Id" from denormalized;

-- adding foreign key constraints to fact tables
alter table fact_sales 
add constraint fk_sales_customer 
foreign key (customer_id) 
references dim_customers (customer_id); 

alter table fact_sales 
add constraint fk_sales_product 
foreign key (product_id)
references dim_products (product_id); 

alter table fact_sales 
add constraint fk_sales_order 
foreign key (order_id)
references dim_order (order_id);

alter table fact_shipment 
add constraint fk_ship_order 
foreign key (order_id)
references dim_order (order_id);



