-- QUESTION ).
USE subquery;

SELECT t1.name,t4.f_name,COUNT(*) FROM subquery.users t1
JOIN subquery.orders t2 ON t1.user_id = t2.user_id
JOIN subquery.order_details t3 ON t2.order_id = t3.order_id
JOIN subquery.food t4 ON t3.f_id = t4.f_id
GROUP BY t2.user_id,t3.f_id 