select 
	o.name,
	c1.id as 'parent_id',
	c1.name as 'parent_name',
 	c2.id as 'class_id' ,
	c2.name as 'class_name'
from classifications c1
join classifications c2 on c1.id = c2.parent_id
join opportunity_classifications oc on oc.classification_id = c2.id
join opportunities o on o.id=oc.opportunity_id
where c1.id=30
