select
	c.id as 'company_id',
	c.name as 'company_name',
	r.id as 'region_id',
	r.name as 'region_name',
	o.id as 'opp_id' ,
	o.name as 'opp_name',
	class1.id as 'parent_id',
	class1.name as 'parent_name',
 	class2.id as 'class_id' ,
	class2.name as 'class_name'
from classifications class1
join classifications class2 on class1.id = class2.parent_id
join opportunity_classifications oc on oc.classification_id = class2.id
join opportunities o on o.id=oc.opportunity_id
join opportunity_region oppr on oppr.opportunity_id = o.id
join regions r on r.id = oppr.region_id
join companies c on c.id = o.company_id
where class1.id=21
