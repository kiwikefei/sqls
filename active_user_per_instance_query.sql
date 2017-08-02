select 
	i.name, count(i.id) as active_count
from instances i
join users u on u.instance_id = i.id
join(
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
			u.created_at between '2017-06-01 00:00:00' and '2017-06-30 00:00:00' or
			uc.started_at between '2017-06-01 00:00:00' and '2017-06-30 00:00:00' or
			p.created_at between '2017-06-01 00:00:00' and '2017-06-30 00:00:00'
		) active_users on u.id = active_users.user_id
group by i.id
