select 
    instance_id, instance_name, CourseName, 
    sum(started) as `Courses Started`, 
    sum(completed) as `Courses Completed`,
    concat(sum(completed) / sum(started) * 100,'%')  as `Progress`
from 
(select
    `users`.`instance_id` as `instance_id`,
    `instances`.`slug` as `instance_slug`,
    `instances`.`name` as `instance_name`,
    `uc`.`name` as `CourseName`,
    case
        when `uc`.`started_at` is NULL then 0
        else 1
    end as `started`,
    case
        when `uc`.`completed_at` is NULL then 0
        else 1
    end as `completed`
from `user_courses` as `uc`
join `users` on `uc`.`user_id` = `users`.`id`
join `instances` on `users`.`instance_id` = `instances`.`id`
where `instances`.`id` <> 4 and `instances`.`id` <> 5) as result
group by instance_id, instance_name, CourseName
