select 
	oc.opportunity_id, o.name,urc.user_id,
	count(oc.course_id) as oc_count,count(urc.user_id)  as urc_count
from opportunity_course oc
left join 
	user_recommended_course urc on urc.course_id = oc.course_id
join 
	opportunities o on oc.opportunity_id = o.id
where o.instance_id= 1 
group by oc.opportunity_id,urc.user_id
having oc_count <> urc_count
