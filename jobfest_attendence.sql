select
	u.id as 'User Id', u.name as 'User Name', ee.user_email as 'Email',
	(case ee.status when 1 then 'No' when 2 then 'Yes' end) as 'Attended',
	(case ee.status when 2 then CONVERT_TZ( ee.updated_at , 'UTC', 'Pacific/Auckland' ) else null end)as 'Time for attendence'
from event_emails ee
join users u on u.id = ee.user_id
order by attended desc
