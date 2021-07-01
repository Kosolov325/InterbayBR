/datum/map/example
	allowed_jobs = list(/datum/job/kid)

/datum/job/kid
	title = "Cadet"
	department = "Civilian"
	faction = "Station"
	department_flag = CIV
	total_positions = -1
	spawn_positions = -1
	supervisors = "Everyone. Especially your parents if you have any"
	create_record = 0             //No one gives a fuck about kids lol.
	account_allowed = 0			  //Kids don't have bank accounts.
	has_email = 0				  //Nor do kids get email accounts.
	outfit_type = /decl/hierarchy/outfit/job/cadet

	equip(var/mob/living/carbon/human/H)
		H.set_species("Child")//Actually makes them a child. Called before ..() so they can get their clothes.
		..()