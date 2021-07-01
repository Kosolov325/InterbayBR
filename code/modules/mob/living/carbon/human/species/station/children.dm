/datum/species/human/child //Oh lord here we go.
	name = "Child"
	name_plural = "Children"
	blurb = "But a child."
	total_health = 150 //Kids are weaker than adults.
	min_age = 10
	max_age = 14
	icobase = 'icons/mob/human_races/child/r_child.dmi'
	deform = 'icons/mob/human_races/child/r_def_child.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_child.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_child.dmi'
	pixel_offset_y = -4
	spawn_flags = SPECIES_IS_RESTRICTED//No more kids becoming nuke ops.


/datum/species/human/child/handle_post_spawn(var/mob/living/carbon/human/H)
	H.mutations.Add(CLUMSY)//So kids don't go around being commandos.
	H.age = rand(min_age,max_age)//Random age for kiddos.
	if(H.f_style)//Children don't get beards.
		H.f_style = "Shaved"
	to_chat(H, "<span class='info'><big>You're [H.age] years old! Act like it!</big></span>")
	spawn (2)
		H.potenzia = max(1, H.potenzia - 5)
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	H.virgin = TRUE
	return ..()

/decl/hierarchy/outfit/job/cadet
	name = "Cadet's Outfit"
	uniform = /obj/item/clothing/under/cadet_jumpsuit
	shoes = /obj/item/clothing/shoes/child_shoes
	l_hand = /obj/item/weapon/material/sword/training