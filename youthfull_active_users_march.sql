select result.id, result.email from 
(select 
	u.id,u.email, u.instance_id, 
	u.created_at as 'User Created', 
	uc.started_at as 'Course Started', 
	p.created_at as 'Pitched Made' from users u
left join user_courses uc on uc.user_id = u.id
left join pitches p on p.user_id = u.id
where 
	u.instance_id = 3 and 
	u.created_at between '2017-04-01 00:00:00' and '2017-05-01 00:00:00' and
	(uc.started_at is not null or p.created_at is not null)
) as result
group by result.id
