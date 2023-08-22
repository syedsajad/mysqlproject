use online_store;
-- ######   Beginner Queries. #########
select * from online_ret;
-- #########   What is the distribution of order values across all customers in the dataset?
--  for this we count invoiceNO #############
select count(distinct InvoiceNo) as total_transaction from online_ret;
select count(distinct CustomerID) from online_ret;


  ###  unique products  ######
  select count(distinct StockCode) from online_ret;
  ### Unique product each customer has purchased ###
  select count(StockCode) as StockCOde, CustomerID 
  from online_ret group by CustomerID
  having count(StockCode)=2;
  
  
   ### Which products are most commonly purchased together by customers in the dataset? ###
select Description, count(Description) as 'most common purchased'
from online_ret
group by Description
order by 'most common purchased' DESC
limit 1;

### Advance Queries ###
### Customer segmentation by purchase frequency ###
select CustomerID,
		case 
			when count(distinct InvoiceNo) >= 10 then 'High Frequency'
            when count(distinct InvoiceNo) >= 5 then 'Medium Frequency'
            else 'low frequency'
		end as frequencies
from online_ret group by CustomerID;



### Calculate the average values by country ###
select Country, avg(Quantity * UnitPrice) as AverageOrderValue
from online_ret group by Country;



### Identify Customer who have not made purchasing ###
select CustomerID 
from online_ret
where InvoiceDate < date_sub(now(), interval 6 month)
group by CustomerID;



  
  
