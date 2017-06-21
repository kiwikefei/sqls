select user_id,users.email, DATE_FORMAT(max(activity_date),'%d%m%Y') as activity_date  
from	 (
		select * from (select u.id as user_id, p.created_at as activity_date 
		from users u
		join pitches p on p.user_id=u.id
		where u.instance_id=3
	 ) as pitch_activities
union (
	select users.id as user_id, users.updated_at as activity_date 
	from users 
	where users.instance_id = 3
	)
union (
	select uc.user_id, uc.started_at as activity_date  
	from user_courses uc
	join users u on uc.user_id = u.id
	where u.instance_id = 3
	)
) as result
join users on user_id = users.id
group by user_id
order by max(activity_date) asc

