/turf/proc/CanZPass(atom/A, direction)
	if(z == A.z) //moving FROM this turf
		return direction == UP //can't go below
	else
		if(direction == UP) //on a turf below, trying to enter
			return 0
		if(direction == DOWN) //on a turf above, trying to enter
			return !density

/turf/simulated/open/CanZPass(atom, direction)
	return 1

/turf/space/CanZPass(atom, direction)
	return 1

/turf/simulated/open
	name = "open space"
	icon = 'icons/turf/space.dmi'
	icon_state = ""
	plane = SPACE_PLANE
	density = 0
	pathweight = 100000 //Seriously, don't try and path over this one numbnuts

	var/turf/below

/turf/simulated/open/post_change()
	..()
	update()

/turf/simulated/open/initialize()
	..()
	update()

/turf/simulated/open/proc/update()
	below = GetBelow(src)
	turf_changed_event.register(below, src, /turf/simulated/open/update_icon)
	var/turf/simulated/T = get_step(src,NORTH)
	if(T)
		turf_changed_event.register(T, src, /turf/simulated/open/update_icon)
	levelupdate()
	for(var/atom/movable/A in src)
		A.fall()
	update_icon()

/turf/simulated/open/update_dirt()
	return 0

/turf/simulated/open/Entered(var/atom/movable/mover)
	..()
	mover.fall()

// Called when thrown object lands on this turf.
/turf/simulated/open/hitby(var/atom/movable/AM, var/speed)
	. = ..()
	AM.fall()

// override to make sure nothing is hidden
/turf/simulated/open/levelupdate()
	for(var/obj/O in src)
		O.hide(0)

/turf/simulated/open/update_icon()
	if(!below)
		return
	overlays.Cut()
	var/image/t_img = list()
	//underlays = list(image(icon = below.icon, icon_state = below.icon_state))
	var/image/temp = image(icon = below.icon, icon_state = below.icon_state, dir=below.dir, layer = ABOVE_WIRE_LAYER + 0.04)
	temp.color = below.color//rgb(127,127,127)
	temp.overlays += below.overlays
	t_img += temp

	var/list/noverlays = list()
	noverlays += t_img
	/*
	if(!istype(below,/turf/space))
		noverlays += image(icon =icon, icon_state = "empty", layer = ABOVE_WIRE_LAYER)
	*/

	/*
	var/turf/simulated/T = get_step(src,NORTH)
	if(istype(T) && !istype(T,/turf/simulated/open))
		noverlays += image(icon ='icons/turf/cliff.dmi', icon_state = "metal", layer = ABOVE_WIRE_LAYER)
	*/
	var/image/o_img = list()
	for(var/obj/o in below)
		if(isitem(o)) continue
		if(o.invisibility) continue//If it's invisible don't render it.
//		if(o.icon == null) continue//If it has no icon don't render it.
		//if(istype(o,/obj/structure/stairs)) continue
		var/image/temp2 = image(o, dir=o.dir, layer = ABOVE_WIRE_LAYER*o.layer)
		temp2.plane = SHADOW_TURF_PLANE
		temp2.color = o.color//rgb(127,127,127)
		temp2.overlays += o.overlays
		temp2.pixel_x = o.pixel_x
		temp2.pixel_y = o.pixel_y
		o_img += temp2
		noverlays += o_img
	/*
	var/image/m_img = list()
	for(var/mob/m in below)
		if(m.invisibility) continue//If it's invisble don't render it.
		if(m.icon == null) continue//If it has no icon don't render it.
		if(istype(m, /mob/living))
			var/image/temp2 = image(m, dir=m.dir, layer = ABOVE_WIRE_LAYER*m.layer)
			temp2.plane = SHADOW_TURF_PLANE
			temp2.color = m.color//rgb(127,127,127)
			temp2.overlays += m.overlays
			temp2.pixel_x = m.pixel_x
			temp2.pixel_y = m.pixel_y
			m_img += temp2
			noverlays += m_img
	*/

	//var/image/I = image('icons/effects/ULIcons.dmi', "[lum]-[lum]-[lum]")
	//I.layer = TURF_LAYER + 0.2
	//noverlays += I
	var/image/dark_layer = image('icons/effects/ULIcons.dmi', "1-1-1")
//	dark_layer.layer = MOB_LAYER
	dark_layer.plane = ABOVE_TURF_PLANE
	overlays += dark_layer

	/*
	var/obj/structure/stairs/S = locate() in below
	if(S && S.loc == below)
		var/image/I = image(icon = S.icon, icon_state = "below", dir = S.dir, layer = ABOVE_WIRE_LAYER)
		I.pixel_x = S.pixel_x
		I.pixel_y = S.pixel_y
		noverlays += I
	*/

	//if(!istype(below,/turf/space))
	//  noverlays += image(icon =icon, icon_state = "empty", layer = ABOVE_WIRE_LAYER)

	underlays = noverlays

/turf/simulated/open/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>You lay down the support lattice.</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(locate(src.x, src.y, src.z))
		return

	if (istype(C, /obj/item/stack/tile))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/floor/S = C
			if (S.get_amount() < 1)
				return
			qdel(L)
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			S.use(1)
			ChangeTurf(/turf/simulated/floor/airless)
			return
		else
			to_chat(user, "<span class='warning'>The plating is going to need some support.</span>")

	//To lay cable.
	if(istype(C, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/coil = C
		coil.turf_place(src, user)
		return
	return

//Most things use is_plating to test if there is a cover tile on top (like regular floors)
/turf/simulated/open/is_plating()
	return 1
