/datum/map/bunker
	allowed_jobs = list(/datum/job/unassigned,/datum/job/overseer,/datum/job/manager,)

/datum/job/unassigned
	title = "Unassigned"
	department_flag = CIV
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()

/datum/job/assistant/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/black(H), slot_shoes)
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
	return 1

/datum/job/assistant/get_access()
	return list(access_maint_tunnels)



/datum/job/overseer
	title = "Overseer"
	department = "Command"
	department_flag = CIV
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "No one. You are the law."
	selection_color = "#ccccff"
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	outfit_type = /decl/hierarchy/outfit/job/bunker/overseer

	get_access()
		return get_all_accesses()

/decl/hierarchy/outfit/job/bunker/overseer
	name = "Overseer"
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/head_of_personnel_whimsy
	id_type = /obj/item/weapon/card/id/bunker/crew/overseer
	pda_type = /obj/item/device/pda/captain



/datum/job/manager
	title = "The Manager"
	department = "Command"
	department_flag = CIV
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Overseer"
	selection_color = "#ddddff"
	outfit_type = /decl/hierarchy/outfit/job/bunker/manager

	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)

/decl/hierarchy/outfit/job/bunker/manager
	name = "Manager"
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/head_of_personnel_whimsy
	id_type = /obj/item/weapon/card/id/bunker/crew/manager
	pda_type = /obj/item/device/pda/heads/hop
