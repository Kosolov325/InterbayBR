/mob
	var/mob/shadow/shadow

/mob/shadow
	plane = 0
	name = "shadow"
	desc = "Z-level shadow"
	density = 0
	mouse_opacity = 0
	layer = TURF_LAYER
	plane = OBJ_MOB_SHADOW_PLANE
	status_flags = GODMODE
	anchored = 1
	unacidable = 1
	opacity = 0					// Don't trigger lighting recalcs gah! TODO - consider multi-z lighting.
	//auto_init = FALSE 			// We do not need to be initialize()d
	var/mob/owner = null		// What we are a shadow of.


/mob/shadow/New(var/mob/L)
	if(!istype(L))
		del(src)
		return
	..()
	owner = L
	sync_icon(L)

/mob/Destroy()
	if(shadow)
		qdel(shadow)
		shadow = null
	. = ..()

/mob/shadow/fall()
	return

/mob/shadow/examine(mob/user)
	return owner.examine(user)

/mob/shadow/proc/sync_icon(var/mob/M)
	name = M.name
	icon = M.icon
	icon_state = M.icon_state
	color = M.color
	overlays = M.overlays
	transform = M.transform
	dir = M.dir
	if(shadow)
		shadow.sync_icon(src)

/mob/proc/check_shadow()
	return

/mob/living/check_shadow()
	var/mob/M = src
	if(isturf(M.loc))
		for(var/turf/simulated/open/OS = GetAbove(src); OS && istype(OS); OS = GetAbove(OS))
			//Check above
			if(!M.shadow)
				M.shadow = new /mob/shadow(M)
			M.shadow.forceMove(OS)
			M = M.shadow

	// Clean up mob shadow if it has one
	if(M.shadow)
		qdel(M.shadow)
		M.shadow = null
		var/client/C = M.client
		if(C && C.eye == shadow)
			M.reset_view(0)
	/*
	if(isturf(M.loc))
		var/turf/simulated/open/OS = GetAbove(src)
		while(OS)
			if(!M.shadow)
				M.shadow = new /mob/shadow(M)
			M.shadow.forceMove(OS)
			M = M.shadow
			OS = GetAbove(M)

	if(M.shadow)
		qdel(M.shadow)
		M.shadow = null
	*/

/mob/living/update_icons()
	..()
	if(shadow)
		shadow.sync_icon(src)

/mob/set_dir(new_dir)
	..()
	if(shadow)
		shadow.set_dir(new_dir)


//ITEMS
/obj/item
	var/obj/item/shadow/shadow

/obj/item/shadow
	plane = 0
	name = "shadow"
	desc = "Z-level shadow"
	density = 0
	mouse_opacity = 0
	throwing = 1
	layer = TURF_LAYER
	plane = OBJ_MOB_SHADOW_PLANE
	var/obj/owner = null

/obj/item/shadow/fall()
	return

/obj/item/shadow/New(var/obj/L)
	if(!istype(L))
		del(src)
		return
	//..()
	owner = L
	sync_icon(L)

/obj/item/Destroy()
	if(shadow)
		qdel(shadow)
		shadow = null
	. = ..()

/obj/item/shadow/examine(mob/user)
	return owner.examine(user)

/obj/item/shadow/proc/sync_icon(var/obj/M)
	name = M.name
	icon = M.icon
	icon_state = M.icon_state
	color = M.color
	overlays = M.overlays
	transform = M.transform
	dir = M.dir
	if(shadow)
		shadow.sync_icon(src)

/obj/item/proc/check_shadow()
	var/obj/item/M = src
	if(isturf(M.loc))
		for(var/turf/simulated/open/OS = GetAbove(src); OS && istype(OS); OS = GetAbove(OS))
			//Check above
			if(!M.shadow)
				M.shadow = new /obj/item/shadow(M)
			M.shadow.forceMove(OS)
			M = M.shadow

	// Clean up mob shadow if it has one
	if(M.shadow)
		qdel(M.shadow)
		M.shadow = null

	/*
	var/obj/item/M = src
	if(isturf(M.loc))
		var/turf/simulated/open/OS = GetAbove(src)
		while(OS)
			if(!M.shadow)
				M.shadow = new /obj/item/shadow(M)
			M.shadow.forceMove(OS)
			M = M.shadow
			OS = GetAbove(M)

	if(M.shadow)
		qdel(M.shadow)
		M.shadow = null
	*/