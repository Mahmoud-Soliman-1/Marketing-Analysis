Select *
from dbo.customers

select *
from dbo.geography


select c.CustomerID,c.Age,c.CustomerName,c.Email,c.Gender,g.Country,g.City
		,case
		when c.Age  < 30 then 'young'
		when c.Age between 30 and 50 then 'youth'
		else ' Old '
		end as GenderCategory
	
from dbo.customers as c
left join dbo.geography as g
on c.GeographyID = g.GeographyID
