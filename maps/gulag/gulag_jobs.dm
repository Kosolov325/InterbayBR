/datum/map/gulag
	allowed_jobs = list(/datum/job/child, /datum/job/prisoner, /datum/job/gulag_warden, /datum/job/gulag_gaurd, /datum/job/chaplain, /datum/job/doctor)


//The Warden
/datum/job/gulag_warden
	title = "Gulag Warden"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	explanation_text = "<big>You are the <b>Warden</b>. Run this shithole. Try to keep your prisoners alive if possible, they're more vauable like that.</big>"
	selection_color = "#601c1c"
	economic_modifier = 5
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/gulag_warden

/datum/job/gulag_warden/get_access()
	return get_all_station_access()


/decl/hierarchy/outfit/job/security/gulag_warden
	name = "Gulag Warden"
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/head_of_security/corp
	id_type = /obj/item/weapon/card/id/gulag/crew/security/warden
	pda_type = /obj/item/device/pda/warden





//His fucking kid
/datum/job/child
	title = "Child of the Warden"//BYOND doesn't like ' for some reason
	department = "Civilian"
	faction = "Station"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	explanation_text = "<big>You are the <b>Warden's Child</b>. You're the heir to this shithole. Listen to you parent and stay out of trouble.</big>"
	create_record = 0
	account_allowed = 0
	has_email = 0
	outfit_type = /decl/hierarchy/outfit/job/cadet

	equip(var/mob/living/carbon/human/H)
		H.set_species("Child")//Actually makes them a child. Called before ..() so they can get their clothes.
		..()


/datum/job/gulag_gaurd
	title = "Gulag Gaurd"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	selection_color = "#601c1c"
	explanation_text = "<big>You are a <b>Gaurd</b>. Obey the Warden and keep the inmates in check.</big>"
	economic_modifier = 4
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks)
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/gulag_gaurd


/decl/hierarchy/outfit/job/security/gulag_gaurd
	name = "Gulag Guard"
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/security
	r_pocket = /obj/item/weapon/handcuffs
	id_type = /obj/item/weapon/card/id/gulag/crew/security
	pda_type = /obj/item/device/pda/security



//The meat
/datum/job/prisoner
	title = "Inmate"
	department = "Civilian"
	faction = "Station"
	department_flag = CIV
	total_positions = 15
	explanation_text = "<big>You are an <b>Inmate</b>. You have comitted crimes and now you're locked up.</big>"
	create_record = 0
	account_allowed = 0
	has_email = 0
	outfit_type = /decl/hierarchy/outfit/job/inmate

	equip(var/mob/living/carbon/human/H)
		H.real_name = "[get_random_prisoner_name()]"//Give them a random prisoner nick name.
		H.name = H.real_name
		..()



//Some helpers for random names
/datum/job/proc/get_random_prisoner_name()
	return "[pick("Spook", "Big", "The Big Boy", "The Big Girl", "Cheese", "Artist", "Greasy", "Dick", "Weasel", "Small", "Dixon", "Dixy", "Rat", "Knot", "Suffering", "Slick", "Scars", "Old Guy", "Heel", "Nine Lives", "Two Fingers", "Poet", "Dash", "Angel", "Bug", "Beast", "Enema", "Animal", "Oz", "Cinnamon", "Heavy", "Echo", "Cannon", "Under", "Smokes", "Joe")]"

/decl/hierarchy/outfit/job/inmate/proc/get_random_crime()
	return "[pick("Muderer", "Rapist", "Tax Evader", "Innoncent", "Revolutionary", "Spy", "Arsonist", "Enemy of the State", "Bad Boy", "Drug Dealer", "Drug Offender", "Poet", "Malpracticer")]"

//Their outfit
/decl/hierarchy/outfit/job/inmate
	name = "Inmate Outfit"
	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/orange
	pda_type = null
	pda_slot = null
	backpack = null
	l_ear = null
	r_ear = null
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR


/decl/hierarchy/outfit/job/inmate/equip()
	id_pda_assignment = "Inmate [rand(1, 1000)], <i>[get_random_crime()]</i>"//Give them a random prisoner assignment.
	..()