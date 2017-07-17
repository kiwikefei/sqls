select 
	concat(month(created_at),'/',year(created_at)) as `month`,
	case 
		when `company_id` = 0 or `company_id` is null then 'learner'
		else 'company'
	end as `role`, 
	count(*) as `count`
from users
where 
	instance_id = 1 and 
	created_at >= '2017-03' and 
	is_enabled =1 and 
	deleted_at is null
group by `month`,`role`
order by `month` , `count`
