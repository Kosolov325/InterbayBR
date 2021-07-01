/decl/emote/human
	key = "vomit"

/decl/emote/human/check_user(var/mob/living/carbon/human/user)
	return (istype(user) && user.check_has_mouth() && !user.isSynthetic())

/decl/emote/human/do_emote(var/mob/living/carbon/human/user)
	user.vomit()

/decl/emote/human/deathgasp
	key = "deathgasp"

/decl/emote/human/deathgasp/get_emote_message_3p(var/mob/living/carbon/human/user)
	return "USER [user.species.get_death_message()]"

/decl/emote/human/swish
	key = "swish"

/decl/emote/human/swish/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_once()

/decl/emote/human/wag
	key = "wag"

/decl/emote/human/wag/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_start()

/decl/emote/human/sway
	key = "sway"

/decl/emote/human/sway/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_start()

/decl/emote/human/qwag
	key = "qwag"

/decl/emote/human/qwag/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_fast()

/decl/emote/human/fastsway
	key = "fastsway"

/decl/emote/human/fastsway/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_fast()

/decl/emote/human/swag
	key = "swag"

/decl/emote/human/swag/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_stop()

/decl/emote/human/stopsway
	key = "stopsway"

/decl/emote/human/stopsway/do_emote(var/mob/living/carbon/human/user)
	user.animate_tail_stop()

//Shitty stuff starts here.
/decl/emote/human/poo
	key = "poo"

/decl/emote/human/poo/do_emote(var/mob/living/carbon/human/user)
	user.handle_shit()

/decl/emote/human/pee
	key = "pee"

/decl/emote/human/pee/do_emote(var/mob/living/carbon/human/user)
	user.handle_piss()

/decl/emote/human/fap
	key = "fap"

/decl/emote/human/fap/do_emote(var/mob/living/carbon/human/user)
	if(user.erpcooldown)
		to_chat(user, "<span class='info'>You don't feel like it right now.</span>")
		return
	for(var/limbcheck in list(BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND))//No fapping without hands or arms.
		var/obj/item/organ/affecting = user.get_organ(limbcheck)
		if(!affecting)
			return
	if(user.handcuffed)//Or if you're cuffed.
		return
	user.visible_message("<b>[user]</b> masturbates.")
	user.lust += 10
	if (user.lust >= user.resistenza)
		user.cum(user, user)