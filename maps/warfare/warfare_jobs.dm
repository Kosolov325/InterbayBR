/datum/map/warfare
	allowed_jobs = list(/datum/job/soldier)

/datum/job/soldier
	title = "Soldier"
	department = "Civilian"
	faction = "Station"
	department_flag = CIV
	total_positions = -1
	create_record = 0
	account_allowed = 0
	has_email = 0
	outfit_type = /decl/hierarchy/outfit/soldier

	equip(var/mob/living/carbon/human/H)
		..()
		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/bayonet(H),slot_back)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty(H),slot_back)

		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(H),slot_wear_mask)

		if(prob(50))
			H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/pistol(H),slot_belt)



/decl/hierarchy/outfit/soldier
	name = "Soldier"
	head = /obj/item/clothing/head/helmet/siege
	uniform = /obj/item/clothing/under/syndicate/soldier
	shoes = /obj/item/clothing/shoes/jackboots
	l_ear = /obj/item/device/radio/headset/syndicate
	//belt = /obj/item/weapon/gun/projectile/pistol
	suit = /obj/item/clothing/suit/storage/vest/opvest
	//mask = /obj/item/clothing/mask/gas
	gloves = /obj/item/clothing/gloves/thick/swat/combat
	back = /obj/item/weapon/gun/projectile/shotgun/pump/boltaction/shitty/bayonet
	flags = OUTFIT_NO_BACKPACK|OUTFIT_NO_SURVIVAL_GEAR