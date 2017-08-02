select 
	i.name as instance_name,
	count(distinct uc.user_id) as user_courses_count,
	count(distinct p.user_id) as user_pitches_count
from users u
join instances i on u.instance_id = i.id
left join user_courses uc on uc.user_id = u.id
left join pitches p on p.user_id = u.id
where 
	(uc.started_at >= '2017-06-01 00:00:00' and 
uc.started_at <='2017-06-30 00:00:00') or
	(p.created_at >= '2017-06-01 00:00:00' and
	p.created_at <= '2017-06-30 00:00:00')
group by u.instance_id
having  
	user_courses_count > 0 and user_pitches_count >0 
