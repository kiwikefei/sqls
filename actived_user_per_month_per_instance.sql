select 
	i.name ,count(actived.user_id) 
from instances i
join users u on u.instance_id = i.id
join(
	select distinct user_id from pitches p 
	where p.created_at between '2017-06-01 00:00:00' and '2017-06-30 00:00:00'
 	union
	select distinct user_id from user_courses uc
	where uc.started_at between '2017-06-01 00:00:00' and '2017-06-30 00:00:00'
	union
	select distinct id as user_id from users u
	where u.created_at between '2017-06-01 00:00:00' and '2017-06-30 00:00:00') 
 as actived on actived.user_id = u.id
group by i.id

