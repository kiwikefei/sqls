-- New Learner Users Query
select 
	i.name as 'Instance Name',
	date_format(u.created_at,'%M') as `Month`, count(u.id) as `New Learner Users`
from users u
join instances i on i.id = u.instance_id
where 
	(u.company_id is null) and 
	u.created_at >='2017-01-01 00:00:00' and 
	u.instance_id = 1 and 
	u.id > 15535
group by i.id,date_format(u.created_at,'%M')

-- New Business Users Query
select 
	i.name as 'Instance Name',
	date_format(u.created_at,'%M') as `Month`, count(u.id) as `New Business Users`
from users u
join instances i on i.id = u.instance_id
where 
	(u.company_id is not null) and 
	u.created_at >='2017-01-01 00:00:00' and 
	u.instance_id = 1 and 
	u.id > 15535
group by i.id,date_format(u.created_at,'%M')

-- Accepted Pitches Query
select 
	date_format(p.updated_at, '%M'), count(*) 
from pitches p
join users u on p.user_id = u.id
where 
	u.instance_id = 1 and 
	p.created_at >= '2017-01-01 00:00:00' and 
	p.status = 'Accepted' and 
	u.id > 15535
group by date_format(p.updated_at, '%M')

-- Jobs Added Query
select 
	date_format(o.created_at, '%M'), count(*) 
from opportunities o
join users u on o.user_id = u.id
where 
	u.instance_id = 1 and 
	o.created_at >= '2017-01-01 00:00:00' and 
	o.deleted_at is null
group by date_format(o.created_at, '%M')

-- Started Courses Query
select date_format(uc.started_at, '%m/%Y') as 'Started', count(uc.id) as total
from user_courses uc
join users u on u.id = uc.user_id
where 
	u.instance_id = 1 and 
	uc.started_at >= '2017-01-01 00:00:00' and 
	u.id > 15535 
group by date_format(uc.started_at, '%m/%Y')
	
-- Completed Courses Query
select date_format(uc.completed_at, '%m/%Y') as 'Started', count(uc.id) as total
from user_courses uc
join users u on u.id = uc.user_id
where 
	u.instance_id = 1 and 
	uc.started_at >= '2017-01-01 00:00:00' and 
	uc.completed_at is not null and
	u.id > 15535 
group by date_format(uc.completed_at, '%m/%Y')

