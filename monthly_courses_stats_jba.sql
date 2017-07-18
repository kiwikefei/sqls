
select 
	date_format(uc.started_at, '%Y-%m') as `started_month`,
	count(uc.id) as `started_count`
from user_courses uc
join users u on uc.user_id = u.id
where u.instance_id = 1 and uc.started_at >= '2017-03'
group by started_month


select 
	date_format(uc.completed_at, '%Y-%m') as `completed_month`,
	count(uc.id) as `completed_count`
from user_courses uc
join users u on uc.user_id = u.id
where u.instance_id = 1 and uc.started_at >= '2017-03'
group by completed_month
