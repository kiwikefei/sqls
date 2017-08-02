select 
	c.name as 'Company Name',
	bu.name as 'Full Name',
	bu.email as 'Email',
	c.phone as 'Phone',
	opp.name as 'Job Opportunities',
	date_format(opp.created_at, '%d/%m/%Y') as 'Date Opportunites Listed',
	(	
		select count(id) from pitches 
		where pitches.opportunity_id = opp.id
	) as '# of pitches recieved',
	(	
		select count(id) from pitches 
		where 
			pitches.opportunity_id = opp.id and 
			status = 'Declined'
	) as '# of pitches declined',
	(	
		select count(id) from pitches 
		where 
			pitches.opportunity_id = opp.id and 
			status = 'Pending'
	) as '# of pitches pending',	
	(	
		select count(id) from pitches 
		where 
			pitches.opportunity_id = opp.id and 
			status = 'Accepted'
	) as '# of pitches accepted',	
	case p.status 
		when 'Accepted' 
		then (select max(`value`) from user_attributes where user_id=p.user_id and `key`='first_name') 
		else null 
	end as 'first name pitch accepted',
	case p.status 
		when 'Accepted' 
		then (select max(`value`) from user_attributes where user_id=p.user_id and `key`='last_name') 
		else null 
	end as 'Last name pitch accepted',
	case p.status 
		when 'Accepted' 
		then lu.email 
		else null 
	end as 'Email of pitch accepted',
	case p.status 
		when 'Accepted' 
		then date_format(`p`.`updated_at`,'%d/%m/%Y')  
		else null 
	end as 'Pitch Accepted Date',
	date_format(c.created_at, '%d/%m/%Y') as 'Date company onboarded'
from pitches p 
right join opportunities opp on p.opportunity_id = opp.id
join companies c on c.id = opp.company_id
join users bu on opp.user_id = bu.id
left join users lu on p.user_id = lu.id
where opp.instance_id = 3

