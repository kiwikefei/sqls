select 
	`u`.`id` as `User Id`,
	max(case when `ua`.`key` = 'first_name' then `ua`.`value` else null end) as "First Name",
	max(case when `ua`.`key` = 'last_name' then `ua`.`value` else null end) as "Last Name",
	`u`.`email` as "Email Address",
	max(case when `ua`.`key` = 'home' or `ua`.`key` = 'phone.home'  then `ua`.`value` else null end) as "Phone Number",
	max(case 
			when `ua`.`key` = 'ethnicity' 
			then (select `name` from `ethnicities` where `id` = `ua`.`value`) 
		else null end) as "Ethnicity",
	max(case when `ua`.`key` = 'drivers_license' then 
			case `ua`.`value`
				when '0' then 'No'
				when '1' then 'Learners'
				when '2' then 'Restricted'
				when '3' then 'Full Licence'
			end 
		else null end) as "Driver's Licence",
	max(case when `ua`.`key` = 'address.suburb' then `ua`.`value` else null end) as "Suburb",
	max(case when `ua`.`key` = 'local_board' then `ua`.`value` else null end) as "Local Board",
	max(case when `ua`.`key` = 'gender' then
			(case `ua`.`value` when '0' then 'Male' when '1' then 'Female' end)
		else null end) as "Male / Female",
	max(case when `ua`.`key` = 'date_of_birth' then `ua`.`value` else null end) as "Birth Date",
	max(case when `ua`.`key` = 'current_situation' then 
			case `ua`.`value`
		 		when '6' then 'Job Seeker Benefit'
			 	when '7' then 'YPP Youth Benefit'
			 	when '8' then 'Paid Employment (Full Time)'
			 	when '9' then 'Paid Employment (Part Time)'
			 	when '10' then 'Employment Unpaid (Volunteer)'
		 		when '11' then 'Training - Private Training Organisation'
		 		when '12' then 'Youth Service Provider'
		 	end else null end) as "Current Situation",
	max(case 
			when `ua`.`key` = 'last_school' 
			then (select `name` from `schools` where `id` = `ua`.`value`) 
		else null end) as "Last School Attended",
	max(case when `ua`.`key` = 'last_school_year' then `ua`.`value` else null end) as "Last School Attended Date",
	(select count(`started_at`) from `user_courses` where `user_id` = `u`.`id`) as "Courses Started",
	(select count(`completed_at`) from `user_courses` where `user_id` = `u`.`id`) as "Courses Completed",	
	(select count(`id`) from `pitches` where `user_id` = `u`.`id`) as "Pitches",
	(select count(`id`) from `pitches` where `user_id` = `u`.`id` and `status` = 'Accepted') as "Pitches Accepted",
	`u`.`created_at` as "Date Registered",
	`u`.`logins` as "Login Times"
from `users` `u`
join `user_attributes` `ua` on `u`.`id` = `ua`.`user_id`
where 
	`u`.`instance_id` = 3
group by `u`.`id`

