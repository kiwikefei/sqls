select 
	concat(month(created_at), '/', year(created_at)) as `month`,
	`status`, count(*) as `count` 
from pitches
where created_at >= '2017-03'
group by `month`, `status`
