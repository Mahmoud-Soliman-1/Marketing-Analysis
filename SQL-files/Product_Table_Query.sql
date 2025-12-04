SELECT *
FROM PortfolioProject_MarketingAnalytics.dbo.products
ORDER BY Price Asc



select ProductID,ProductName,Price 
	   ,case
	    when Price < 100 then 'Low'
		when Price between 100 and 300 then 'Medium'
		Else 'High'
		End as PriceCategory

from PortfolioProject_MarketingAnalytics.dbo.products
order by price asc