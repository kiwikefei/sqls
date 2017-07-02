select
	users.id,
	users.email,
	concat('open.joybusinessacademy.com/user/', users.id) as 'User Link',
	users.name as 'Pitched By',
	employer.name as 'Pitched To',
	companies.name as 'Company',
	companies.slug as 'Slug',
	max(case when backgrounds.type='profile' then backgrounds.json else null end) as 'Profile Information' ,
	p.opportunity_id,
	p.name,
	p.document_url,
	p.document_name ,
	concat('open.joybusinessacademy.com/pitches/', p.id, '/download') as 'document_path',
	p.status,
	p.user_feedback ,
	p.recipient_feedback,
	p.created_at
from pitches p
join users on p.user_id=users.id
join users employer on p.recipient_id=employer.id
join companies on employer.company_id = companies.id
left join backgrounds on users.id = backgrounds.user_id
where
	p.created_at > '2017-04-01 00:00:00' AND
	users.instance_id = 1 GROUP BY
	users.id, p.id
