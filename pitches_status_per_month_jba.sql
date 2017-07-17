select 
	concat(month(p.created_at), '/', year(p.created_at)) as `month`,
	`p`.`status`, count(p.id) as `count` 
from pitches p
join opportunities op on p.`opportunity_id` = op.id
where p.created_at >= '2017-03'
and op.instance_id = 1
group by `month`, `status`
