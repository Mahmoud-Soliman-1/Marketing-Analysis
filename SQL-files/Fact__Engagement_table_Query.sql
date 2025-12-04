select * from dbo.engagement_data



select EngagementID,
		ContentID,
		CampaignID,
		 ProductID,
		UPPER(REPLACE(ContentType ,'Socialmedia','Social Media')) as ContentType,
		Likes,
		cast(left(ViewsClicksCombined,Charindex('-',ViewsClicksCombined)-1)as float) as TheViews,
		cast(right(ViewsClicksCombined,len(ViewsClicksCombined)- Charindex('-',ViewsClicksCombined)) as float ) as Clicks,
		format(Convert(Date,EngagementDate),'MM/dd/yyyy') AS EngagementDate
from dbo.engagement_data
