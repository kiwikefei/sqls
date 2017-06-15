select
    `users`.`instance_id` as `instance_id`,
    `instances`.`name` as `instance_name`,
    `uc`.`name` as `CourseName`,
    `users`.`id` as `user_id`,
    `users`.`name` as `user_name`,
    date(`uc`.`started_at`) as `started_date`,
    case
        when `uc`.`completed_at` is NULL then 'n/a'
        else date(`uc`.`completed_at`)
    end as `completed_date`
from `user_courses` as `uc`
join `users` on `uc`.`user_id` = `users`.`id`
join `instances` on `users`.`instance_id` = `instances`.`id`
where 
    `instances`.`id` <> 4 and `instances`.`id` <> 5 and 
    `uc`.`started_at` is not null
order by 
    `instances`.`id` asc
