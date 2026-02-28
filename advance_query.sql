-- Advance Query
 
 -- 1) retrive the total number of books sold for each genre:
 select * from ORDERS;
 select b.Genre ,SUM(o.Quantity) AS Total_Books_sold
 From Orders o
 join Books b ON o.book_id = b.book_id
 group by b.Genre;
 
 
 -- 2) find the average price of books in the fantasy genre;
select avg(price) as Average_Price
from Books
where Genre = 'Fantasy';

-- 3) list customers who have placed at least 2 orders:
select o.customer_id,c.name,COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
join customers c on o.customer_id=c.customer_id
group by o.customer_id,c.name
having count(order_id)>=2;

-- 4) find the most frequently ordered book:
select o.Book_id,b.title,COUNT(o.order_id) as ORDER_COUNT
FROM orders o
join books b on o.book_id=b.book_id
group by o.book_id,b.title
order by ORDER_COUNT DESC LIMIT 1;

-- 5) show the top 3 most expensive books of 'Fantasy' Genre:
select * from books
where genre ='Fantasy'
order by price desc limit 3;

-- 6) retrive the total quantity of books sold by each author:
select b.author ,sum(o.quantity) as Total_Books_Sold
From orders o
join books b on o.book_id=b.book_id
group by b.author ;

-- 7) list the cities where customers who spent over $30 are located:
select distinct c.city , Total_Amount
from  orders o
join customers c on o.customer_id=c.customer_id
where o.total_amount > 30;

-- 8) find the customer who spent the most on orders:
select c.customer_id,c.name,sum(o.total_amount) as total_spent
from orders o
join customers c on o.customer_id=c.customer_id
group by c.customer_id,c.name
order by total_spent desc limit 1;

-- 9) calculate the stock remaining after fulfilling all orders:
select b.book_id,b.title,b.stock,coalesce(sum(quantity),0) as order_quantity,
b.stock- coalesce(sum(o.quantity),0) as Remaining_Quantity
from books b
left join orders o on b.book_id=o.book_id
group by b.book_id;
