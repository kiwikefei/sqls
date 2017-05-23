select 
	date_format(created_at,'%Y%m')  as `date`, 
	count(*) as `registered user`, 
	(select count(*) from users where instance_id=3) as total 
from users
where  instance_id =3 
group by date_format(created_at,'%Y-%m')
