select  
	distinct case when u.id is null then 
		case when uc.user_id is null then 
			p.user_id
		else
			uc.user_id
		end
	else
		u.id
	end as 'user_id'
from users u
join instances i on u.instance_id = i.id 
right join user_courses uc on uc.user_id = u.id
right join pitches p on p.user_id = u.id
where 
	u.created_at > (now() - interval 1 month) or
	uc.started_at > (now() - interval 1 month) or
	p.created_at> (now() - interval 1 month)
