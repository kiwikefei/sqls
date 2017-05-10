select
	p.id as `Pitch Id`, p.user_id as `User Id`,
	u.name as `User Name`, u.email as `Email`,
	max(case when `ua`.`key` = 'mobile' then `ua`.`value` else null end) as `Mobile`,
	c.name as `Company Name`,
	oppor.name as `Opportunity Name`,
	p.created_at as `When was Pitched`,
	p.updated_at as `When was Accepted`
from pitches p
join users u on u.id = p.user_id
join instances inst on inst.id = u.instance_id
join opportunities oppor on oppor.id = p.opportunity_id
join companies c on c.id = oppor.company_id
left join user_attributes ua on ua.user_id = u.id
where
	inst.id = 3 and
	p.status = 'Accepted' and
	p.updated_at between '2017-03-01 00:00:00' and '2017-05-03 00:00:00'
group by p.id, p.user_id
