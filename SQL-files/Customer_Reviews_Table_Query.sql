select * 
from dbo.customer_reviews



select ReviewID,
	   CustomerID,
	   ProductID,
	   format(convert(date,ReviewDate),'MM/dd/yyyy') as ReviewDate,
	   Rating,
	    REPLACE(ReviewText,'  ',' ') as ReviewText
from dbo.customer_reviews