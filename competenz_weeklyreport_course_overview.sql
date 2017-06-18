select
	user_id as id,user_name as name ,user_email as email ,
	created_at,updated_at, sum(started) as 'Courses started' ,
	sum(completed) as 'Courses completed' ,
	concat(sum(completed) / sum(started) * 100,'%') as Progress
from (
	select
		users.id as user_id , users.name as user_name , 
		users.email as user_email , users.logins , 
		users.created_at , users.updated_at , uc.name as CourseName ,
		case when uc.started_at is NULL then 0 else 1 end as started , 
		case when uc.completed_at is NULL then 0 else 1 end as completed 
	from user_courses as uc 
	join users on uc.user_id = users.id
	join instances on users.instance_id = instances.id 
	where
		instances.id = 7 AND
		uc.started_at >= curdate() - interval dayofweek(curdate()) + 6 day and uc.started_at < curdate() - interval dayofweek(curdate())-1 day
) as result
group by user_id