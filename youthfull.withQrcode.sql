select `youthfull`.*,
(case `event_emails`.`status`
	when 2 then 'Yes'
	else 'No'
	end) as `Attended Jobfest`
from (
select
	user_id as `User ID`,
	max(case when `result`.`key` = 'first_name' then `result`.`value` else null end) as `First Name`,
	max(case when `result`.`key` = 'last_name' then `result`.`value` else null end) as `Last Name`,
	email as `Email Addess`,
	max(case when `result`.`key` = 'home' or `result`.`key` = 'phone.home'  then `result`.`value` else null end) as `Home Phone Number`,
	max(case when `result`.`key` = 'mobile' or `result`.`key` = 'phone.mobile'  then `result`.`value` else null end) as `Mobile Phone Number`,
	max(case when `result`.`key` = 'gender' then
			(case `result`.`value` when '0' then 'Male' when '1' then 'Female' else 'Unknow' end)
		else null end) as `Gender`,
	max(case when `result`.`key` = 'date_of_birth' then `result`.`value` else null end) as `Date of Birth`,
	max(case when `result`.`key` = 'last_school' then `result`.`value` else null end) as `Last School Attended`,
	max(case when `result`.`key` = 'last_school_year' then `result`.`value` else null end) as `Last School Year`,
	max(case when `result`.`key` = 'address.street' then `result`.`value` else null end) as `Street Address`,
	max(case when `result`.`key` = 'address.suburb' then `result`.`value` else null end) as `Suburb`,
	max(case when `result`.`key` = 'local_board' then `result`.`value` else null end) as `Local Board`,
	max(case when `result`.`key` = 'address.postcode' then `result`.`value` else null end) as `Postcode`,
	max(case when `result`.`key` = 'ethnicity' then
			(case `result`.`value`
     			when '21' then 'Asian nfd'
			    when '24' then 'Cambodian'
			    when '27' then 'Chinese'
				when '23' then 'Filipino'
				when '28' then 'Indian'
				when '30' then 'Japanese'
				when '31' then 'Korean'
				when '32' then 'Other Asian'
				when '26' then 'Other Southeast Asian'
				when '22' then 'Southeast Asian nfd'
				when '29' then 'Sri Lankan'
				when '25' then 'Vietnamese'
				when '10' then 'Australian'
				when '3' then 'British and Irish'
				when '4' then 'Dutch'
				when '1' then 'European nfd'
				when '9' then 'German'
				when '5' then 'Greek'
				when '8' then 'Italian'
				when '2' then 'New Zealand European'
     			when '11' then 'Other European'
     			when '6' then 'Polish'
     			when '7' then 'South Slav'
     			when '12' then 'Maori'
     			when '35' then 'African'
     			when '33' then 'Middle Eastern'
     			when '36' then 'Other Ethnicity'
     			when '15' then 'Cook Islands Maori'
     			when '19' then 'Fijian'
     			when '17' then 'Niuean'
     			when '20' then 'Other Pacific Peoples'
     			when '13' then 'Pacific Peoples nfd'
     			when '14' then 'Samoan'
     			when '18' then 'Tokelauan'
     			when '16' then 'Tongan'
     		end)
		 else null end) as `Ethnicity`,
	max(case when `result`.`key` = 'iwi' then
			(case `result`.`value`
                when '153' then 'Hapu Affiliated To More Than One Iwi'
                when '16' then 'Hauraki (coromandel) Region, Not Further Defined'
                when '25' then 'Ngai Tai (hauraki)'
                when '17' then 'Ngati Hako'
                when '18' then 'Ngati Hei'
                when '19' then 'Ngati Maru (hauraki)'
                when '20' then 'Ngati Paoa'
                when '22' then 'Ngati Porou Ki Harataunga Ki Mataora'
                when '23' then 'Ngati Pukenga Ki Waiau'
                when '24' then 'Ngati Rahiri Tumutumu'
                when '26' then 'Ngati Tamatera'
                when '27' then 'Ngati Tara Tokanui'
                when '28' then 'Ngati Whanaunga'
                when '21' then 'Patukirikiri'
                when '151' then 'Ngati Apa'
                when '143' then 'Ngati Haua'
                when '144' then 'Ngati Maru'
                when '145' then 'Ngati Mutunga'
                when '147' then 'Ngati Raukawa'
                when '148' then 'Ngati Tama'
                when '149' then 'Ngati Toa'
                when '146' then 'Rangitane'
                when '142' then 'Te Atiawa'
                when '150' then 'Waitaha'
                when '127' then 'Aotea'
                when '136' then 'Hauraki / Pare Hauraki'
                when '140' then 'Horouta'
                when '134' then 'Kurahaupo'
                when '129' then 'Mahuru'
                when '130' then 'Mamari'
                when '128' then 'Mataatua'
                when '135' then 'Muriwhenua'
                when '131' then 'Ngatokimatawhaorua'
                when '132' then 'Nukutere'
                when '124' then 'Tainui'
                when '126' then 'Takitimu'
                when '139' then 'Tauranga Moana'
                when '125' then 'Te Arawa'
                when '138' then 'Te Tauihu O Te Waka A Maui'
                when '133' then 'Tokomaru'
                when '137' then 'Turanganui A Kiwa'
                when '99' then 'Manawatu/horowhenua/te Whanganui-a-tara(manawatu/horowhenua/wellington)regionnfd'
                when '101' then 'Muaupoko'
                when '107' then 'Ngati Kauwhata'
                when '103' then 'Ngati Raukawa (horowhenua/manawatu)'
                when '106' then 'Ngati Tama Ki Te Upoko O Te Ika (te Whanganui-a-tara/wellington)'
                when '104' then 'Ngati Toarangatira (te Whanganui-a-tara/wellington)'
                when '102' then 'Rangitane (manawatu)'
                when '100' then 'Te Atiawa (te Whanganui-a-tara/wellington)'
                when '105' then 'Te Atiawa Ki Whakarongotai'
                when '85' then 'Nga Rauru'
                when '86' then 'Nga Ruahine'
                when '83' then 'Ngati Maru (taranaki)'
                when '84' then 'Ngati Mutunga (taranaki)'
                when '87' then 'Ngati Ruanui'
                when '88' then 'Ngati Tama (taranaki)'
                when '91' then 'Pakakohi'
                when '90' then 'Tangahoe'
                when '89' then 'Taranaki'
                when '81' then 'Taranaki (taranaki) Region, Not Further Defined'
                when '82' then 'Te Atiawa (taranaki)'
                when '56' then 'Ngai Tai (tauranga Moana/mataatua'
                when '52' then 'Ngaiterangi'
                when '54' then 'Ngati Awa'
                when '55' then 'Ngati Manawa'
                when '51' then 'Ngati Pukenga'
                when '53' then 'Ngati Ranginui'
                when '60' then 'Ngati Whare'
                when '50' then 'Tauranga Moana/mataatua (bay Of Plenty) Region, Not Further Defined'
                when '59' then 'Te Whanau-a-apanui'
                when '57' then 'Tuhoe'
                when '58' then 'Whakatohea'
                when '37' then 'Ngati Pikiao (te Arawa)'
                when '38' then 'Ngati Rangiteaorere (te Arawa)'
                when '39' then 'Ngati Rangitihi (te Arawa'
                when '40' then 'Ngati Rangiwewehi (te Arawa)'
                when '48' then 'Ngati Tahu-ngati Whaoa (te Arawa)'
                when '47' then 'Ngati Tuwharetoa)'
                when '46' then 'Ngati Whakaue (te Arawa)'
                when '41' then 'Tapuika (te Arawa)'
                when '42' then 'Tarawhai (te Arawa)'
                when '36' then 'Te Arawa/taupo (rotorua/taupo) Region, Not Further Defined'
                when '43' then 'Tuhourangi (te Arawa)'
                when '44' then 'Uenuku-kopako (te Arawa)'
                when '45' then 'Waitaha (te Arawa)'
                when '71' then 'Ngati Kahungunu Ki Heretaunga'
                when '77' then 'Ngati Kahungunu Ki Tamakinui A Rua'
                when '76' then 'Ngati Kahungunu Ki Tamatea'
                when '70' then 'Ngati Kahungunu Ki Te Wairoa'
                when '75' then 'Ngati Kahungunu Ki Te Whanganui-a-orotu'
                when '72' then 'Ngati Kahungunu Ki Wairarapa'
                when '73' then 'Ngati Kahungunu, Region Unspecified'
                when '78' then 'Ngati Pahauwera'
                when '79' then 'Ngati Rakaipaaka'
                when '74' then 'Rangitane (te Matau-a-maui/hawke''s Bay/wairarapa)'
                when '69' then 'Rongomaiwahine (te Mahia)'
                when '68' then 'Te Matau-a-maui/wairarapa (hawke''s Bay/wairarapa) Region, Not Further Defined'
                when '66' then 'Ngai Tamanuhiri'
                when '63' then 'Ngati Porou'
                when '65' then 'Rongowhakaata'
                when '64' then 'Te Aitanga-a-mahaki'
                when '62' then 'Te Tai Rawhiti (east Coast) Region, Not Further Defined'
                when '9' then 'Ngai Takoto'
                when '6' then 'Ngapuhi'
                when '7' then 'Ngapuhi Ki Whaingaroa-ngati Kahu Ki Whaingaroa'
                when '4' then 'Ngati Kahu'
                when '5' then 'Ngati Kuri'
                when '10' then 'Ngati Wai'
                when '11' then 'Ngati Whatua'
                when '3' then 'Te Aupouri'
                when '12' then 'Te Kawerau'
                when '8' then 'Te Rarawa'
                when '14' then 'Te Roroa'
                when '2' then 'Te Tai Tokerau/tamaki-makaurau (northland/auckland) Region, Not Further Defined'
                when '13' then 'Te Uri-o-hau'
                when '113' then 'Kati Mamoe'
                when '114' then 'Moriori'
                when '118' then 'Ngai Tahu / Kai Tahu'
                when '122' then 'Ngati Apa Ki Te Ra To'
                when '111' then 'Ngati Koata'
                when '112' then 'Ngati Kuia'
                when '115' then 'Ngati Mutunga (wharekauri/chatham Islands'
                when '117' then 'Ngati Rarua'
                when '119' then 'Ngati Tama (te Waipounamu/south Island)'
                when '120' then 'Ngati Toarangatira (te Waipounamu/south Island)'
                when '116' then 'Rangitane (te Waipounamu/south Island)'
                when '110' then 'Te Atiawa (te Waipounamu/south Island)'
                when '109' then 'Te Waipounamu/wharekauri (south Island/chatham Islands) Region, Nfd'
                when '121' then 'Waitaha (te Waipounamu/south Island)'
                when '31' then 'Ngati Haua (waikato)'
                when '32' then 'Ngati Maniapoto'
                when '33' then 'Ngati Raukawa (waikato)'
                when '34' then 'Waikato'
                when '30' then 'Waikato/te Rohe Potae (waikato/king Country) Region, Not Further Defined'
                when '94' then 'Ngati Apa (rangitikei)'
                when '96' then 'Ngati Haua (taumarunui)'
                when '97' then 'Ngati Hauiti'
                when '95' then 'Te Ati Haunui-a-paparangi'
                when '93' then 'Whanganui/rangitikei (wanganui/rangitikei) Region, Not Further Defined'
			end)
		else null end) as `iwi`,
	group_concat(case
		when substring_index(`result`.`key`, '.', 1) = 'interests' and substring_index(`result`.`key`, '.', -1) = 'interested' then
			(case substring_index(substring_index(`result`.`key`,'.', -2), '.', 1)
                when '1' then 'Construction'
                when '2' then 'Digital'
                when '3' then 'Financial Services'
                when '4' then 'Health'
                when '5' then 'Hospitality'
                when '6' then 'Manufacturing'
                when '7' then 'Professional Services'
                when '8' then 'Public Sector'
                when '9' then 'Recruitment'
                when '10' then 'Retail'
                when '11' then 'Telecommunications'
                when '12' then 'Transport + Logistics'
			end)
		 else null end SEPARATOR ', ') as `Job Interests (interests)`,
	group_concat(case
		when substring_index(`result`.`key`, '.', 1) = 'interests' and substring_index(`result`.`key`, '.', -1) = 'skilled' then
			(case substring_index(substring_index(`result`.`key`,'.', -2), '.', 1)
                when '1' then 'Construction'
                when '2' then 'Digital'
                when '3' then 'Financial Services'
                when '4' then 'Health'
                when '5' then 'Hospitality'
                when '6' then 'Manufacturing'
                when '7' then 'Professional Services'
                when '8' then 'Public Sector'
                when '9' then 'Recruitment'
                when '10' then 'Retail'
                when '11' then 'Telecommunications'
                when '12' then 'Transport + Logistics'
			end)
		 else null end SEPARATOR ', ') as `Job Interests (skilled)`,

	group_concat(case
		when substring_index(`result`.`key`, '.', 1) = 'interests' and substring_index(`result`.`key`, '.', -1) = 'experience' then
			(case substring_index(substring_index(`result`.`key`,'.', -2), '.', 1)
                when '1' then 'Construction'
                when '2' then 'Digital'
                when '3' then 'Financial Services'
                when '4' then 'Health'
                when '5' then 'Hospitality'
                when '6' then 'Manufacturing'
                when '7' then 'Professional Services'
                when '8' then 'Public Sector'
                when '9' then 'Recruitment'
                when '10' then 'Retail'
                when '11' then 'Telecommunications'
                when '12' then 'Transport + Logistics'
			end)
		 else null end SEPARATOR ', ') as `Job Interests (experience)`,
		 	max(case when `result`.`key` = 'looking_for_job' then case `result`.`value` when '0' then 'No' when '1' then 'Yes' end else null end) as `Looking for A Job`,
		 	max(case when `result`.`key` = 'current_situation' then case `result`.`value`
		 	when '6' then 'Job Seeker Benefit'
		 	when '7' then 'YPP Youth Benefit'
		 	when '8' then 'Paid Employment (Full Time)'
		 	when '9' then 'Paid Employment (Part Time)'
		 	when '10' then 'Employment Unpaid (Volunteer)'
		 	when '11' then 'Training - Private Training Organisation'
		 	when '12' then 'Youth Service Provider'
		 	end else null end) as `Current Situation`,
	max(case when `result`.`key` = 'current_cv' then case `result`.`value` when '1' then 'Yes' when '0' then 'No' end else null end) as `Have a current CV`,
	max(case when `result`.`key` = 'attended_jobfest' then case `result`.`value` when '1' then 'Yes' when '0' then 'No' end else null end) as `Attended JobFest Before`,
	max(case when `result`.`key` = 'wr_or_cvw' then case `result`.`value` when '1' then 'Yes' when '0' then 'No' end else null end) as `Work Readiness / CV Workshop`,
	max(case when `result`.`key` = 'drivers_license' then case `result`.`value`
		 	when '0' then 'No'
		 	when '1' then 'Learners'
		 	when '2' then 'Restricted'
		 	when '3' then 'Full Licence'
		 	end else null end) as `Driver's Licence`,
	max(case when `result`.`key` = 'hear_about_jobfest' then case `result`.`value` when NULL then 'n/a' else `result`.`value` end else null end) as `Hear About JobFest`,
	max(case when `result`.`key` = 'like_to_join_facebook' then case `result`.`value` when '0' then 'No' when '1' then 'Yes' end else null end) as `Like to join Facebook`,
	max(case when `result`.`key` = 'registering_for_jobfest' then case `result`.`value` when '0' then 'No' when '1' then 'Yes' end else null end) as `Registering For JobFest`,
	max(case when `result`.`key` = 'need_public_transport' then case `result`.`value` when '0' then 'No' when '1' then 'Yes' end else null end) as `Need Public Transport`

from (select
		`ua`.`user_id`, `users`.`email`,
		`ua`.`key`,`ua`.`value`
	from `user_attributes` `ua`
	join `users` on `users`.`id` = `ua`.`user_id`
	join `instances` on `instances`.`id` = `users`.`instance_id`
	where `instances`.`id` = 3 ) as result
group by user_id ) as youthfull
left join `event_emails` on `event_emails`.`user_id` = `youthfull`.`User ID`
