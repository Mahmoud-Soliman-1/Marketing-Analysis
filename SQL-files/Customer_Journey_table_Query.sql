select * 
from dbo.customer_journey 

with DuplicatedRecords as(
select JourneyID,CustomerID,ProductID,format(convert(date,VisitDate),'dd/MM/yyyy') as VisitDate
	   ,Stage,Action,Duration,
	   ROW_NUMBER() over ( partition by CustomerID,
							ProductID,VisitDate,Stage,Action 
							order by JourneyID ) as row_num 
from dbo.customer_journey
)

select *
from DuplicatedRecords
Where row_num > 1





Select JourneyID,CustomerID,ProductID,format(convert(date,VisitDate),'MM/dd/yyyy') as VisitDate
	   ,Stage,Action,Coalesce(Duration , avg_duration ) as Duration

from (


select JourneyID,CustomerID,ProductID,
	   VisitDate
	   ,upper(Stage) as Stage,
	   Action,
	   Duration,
	   avg(Duration) over(partition by VisitDate) as avg_duration,
	   ROW_NUMBER() over ( partition by CustomerID,
							ProductID,VisitDate,upper(Stage),Action 
							order by JourneyID ) as row_num 
from dbo.customer_journey 
) as subquery 
where row_num = 1 
