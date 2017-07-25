select 
	ins.id as instance_id, 
	ins.name as intance_name,
	i.id as invoice_id, 
	u.id as user_id,
	u.name as user_name,
	u.email as user_email,
	i.*
from invoices i
join user_subscriptions us on us.id = i.user_subscription_id
join users u on us.user_id = u.id
join instances ins on u.instance_id = ins.id
where 
	i.payment_status='paid' and 
	i.json is not null and
	instr(i.json, '411111........11') <=0

