select *from sales
where Amount>2000 and Boxes<100;

select * from sales 
where SaleDate>='2022-01-01' and SaleDate<='2022-01-31';


select s.SaleDate, p.Salesperson, p.spid, count(*) as 'Sales Count'
from sales s
join people p on s.spid = p.spid
where s.SaleDate >= '2022-01-01' and s.SaleDate <= '2022-12-31'
group by p.Salesperson
order by p.spid desc;

select p.Product, sum(s.Boxes) as 'Total Sold'
from products p
join sales s on s.pid=p.pid
where p.Product in ('Milk Bars','Eclairs') and s.SaleDate between '2022-02-01' and '2022-02-10'
group by p.Product;

select Customers, Boxes, SaleDate
from sales
where Customers<100 and Boxes<100;

select *,
case when weekday(saledate)=2 then 'Wednesday Shipment'
else NULL
end as 'Shipment_day'
from sales
where customers < 100 and boxes < 100;


select distinct p.Salesperson, s.Boxes
from people as p
join sales s on s.SPID=p.SPID
where s.SaleDate between '2022-01-01' and '2022-01-07'
group by p.Salesperson;

select p.salesperson
from people p
where p.spid not in (select distinct s.spid from sales s where s.SaleDate between '2022-01-01' and '2022-01-07');

select year(SaleDate), month(SaleDate), count(*) 'Times Shipped'
from sales
where Boxes>1000
group by year(SaleDate), month(SaleDate)
order by year(SaleDate), month(SaleDate);


set @product_name = 'After Nines';
set @country_name = 'New Zealand';

select year(saledate) 'Year', month(saledate) 'Month',
if(sum(boxes)>1, 'Yes','No') 'Status'
from sales s
join products pr on pr.PID = s.PID
join geo g on g.GeoID=s.GeoID
where pr.Product = @product_name and g.Geo = @country_name
group by year(saledate), month(saledate)
order by year(saledate), month(saledate);

select year(s.SaleDate), month(s.SaleDate), sum(Boxes),
sum(CASE WHEN c.geo='India' = 1 THEN boxes ELSE 0 END) 'India Boxes',
sum(CASE WHEN c.geo='Australia' = 1 THEN boxes ELSE 0 END) 'Australia Boxes'
from sales s
join geo c on s.GeoID=c.GeoID
where c.geo in ('India','Australia')
group by year(s.SaleDate), month(s.SaleDate);

select * from sales
where Customers is null;

delete from sales
where Customers = null;

select * from sales
where Customers is null;

alter table sales
add Hello varchar(255);

select SaleDate from sales 
where day(SaleDate)='01';