select 
	users.id, users.name , users.email , uc.name as CourseName , 
	uc.started_at , uc.completed_at 
from user_courses as uc 
join users on uc.user_id = users.id
join instances on users.instance_id = instances.id 
where
	instances.id = 7