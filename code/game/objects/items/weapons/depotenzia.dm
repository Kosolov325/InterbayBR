var/list/depotenzia_types = list(
	/obj/item/weapon/wirecutters,
	/obj/item/weapon/material/knife,
	/obj/item/weapon/circular_saw)

/obj/item/proc/depotenzia_check()
	for (var/_type in depotenzia_types)
		if (istype(src, _type))
			return TRUE
	return FALSE

/obj/item/proc/depotenzia(mob/living/carbon/C as mob, mob/living/user as mob)
	if (depotenzia_check())
		if (ishuman(C) && ishuman(user))
			if (user.zone_sel.selecting == "groin")
				remove_penis(C, user)
				return TRUE
	return FALSE

/obj/item/proc/remove_penis(var/mob/living/carbon/human/H, var/mob/living/carbon/human/user)
	var/haspenis = (H.gender == MALE && H.potenzia > -1 && H.species.genitals && !H.mutilated_genitals)
	if(H.is_nude())//Gotta be naked.
		if(haspenis)//And have a dick.
			if(!user.doing_something)//Are they doing something?
				user.doing_something = TRUE//Good their not run all this shit.
				H.visible_message("<span class='danger'>[user] tries to cut off [H]'s penis with [src]!</span>",
									"<span class='danger'>[user] tries to cut off your penis with [src]!</span>")
				if(do_after(user, 50))
					H.visible_message("<span class='danger'>[user] cuts off [H]'s penis with [src]!</span>",
									"<span class='danger'>[user] cuts off your penis with [src]!</span>")
					H.custom_pain("[pick("OH GOD MY DICK!", "OH GOD WHY!", "OH GOD IT HURTS!")]", 100, BP_GROIN)//Pain.
					H.apply_damage(rand(30,45), BRUTE, BP_GROIN)
					playsound(H, 'sound/effects/gore/severed.ogg', 50, 1, -1)
					H.mutilate_genitals()
					new /obj/item/organ/internal/penis(H.loc)
					user.doing_something = FALSE
				else
					to_chat(user, "<span class='notice'>You fail to cut off their penis...</span>")
					user.doing_something = FALSE
					return
			else
				to_chat(user, "<span class='notice'>You are already trying to cut off their penis!</span>")
		else
			to_chat(user, "They have no penis.")
	else
		to_chat(user, "They must be naked to perform the act.")