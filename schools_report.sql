-- List of Schools that have registered on JBA Schools whitelabel?
select distinct ua.value as 'Schools' from user_courses uc
join users u on u.id = uc.user_id
join user_attributes ua on uc.user_id = ua.user_id
where u.instance_id=8 and ua.`key` = 'school'


--Number of Courses started and completed for JBA schools
select count(started_at) as courses_started, count(completed_at) as courses_completed from user_courses uc
join users u on u.id = uc.user_id
where u.instance_id = 8


--Most popular courses undertaken (list all courses in order of complettion)
select 
	c.id as `Course ID`, 
	c.name as `Course Name`, 
	count(uc.started_at) `Started Count`, 	
	count(uc.completed_at) `Completed Count`,
	concat(format(count(uc.completed_at)/count(uc.started_at) * 100,0),'%') as `Completion`  
from user_courses uc
join users u on u.id = uc.user_id
join courses c on uc.course_id = c.id
where u.instance_id = 8
group by c.id
order by count(uc.completed_at)/count(uc.started_at)


