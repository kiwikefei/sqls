select 
	i.id as instance_id,
	i.name as instance_name,
	c.name as CourseName,
	c.id as course_id,
	u.id as user_id,
	u.name as user_name,
	uc.started_at as started_date,
	(case 
		when uc.completed_at is null then 'n/a' 
		else uc.completed_at end) as completed_date
from user_courses uc
join users u on uc.user_id = u.id
join instances i on u.instance_id = i.id
join courses c on uc.course_id = c.id
where 
--	uc.started_at > '2017-07-23 00:00:00' and
	u.id > 15535 
