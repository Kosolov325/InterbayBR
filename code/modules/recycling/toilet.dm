/obj/machinery/disposal/toilet/
	name = "toilet"
	desc = "The HT-460, a vacuum based, waste disposal unit for small matter. This one seems remarkably clean."
	icon = 'icons/obj/machines/toilets.dmi'
	icon_state = "base"
	density = 0
	var/open = 0
	var/cistern_open = 0
	var/w_items = 0
	var/mob/living/swirlie = null	//the mob being given a swirlie
	flags = 0
	ptype = DISPOSAL_TOILET

/obj/machinery/disposal/toilet/New()
	..()
	open = round(rand(0, 1))
	update_icon()

/obj/machinery/disposal/toilet/attack_ai(mob/user as mob)
	return

/obj/machinery/disposal/toilet/interact(mob/user, var/ai=0)
	return

/obj/machinery/disposal/toilet/MouseDrop_T(mob/target, mob/user)
	//No climbing into toilets.
	return

/obj/machinery/disposal/toilet/update_icon()
	overlays.Cut()
	if(!cistern_open)
		overlays += image(icon, dir, icon_state = "cisternlid")
	if(open)
		overlays += image(icon, dir, icon_state = "lid-up")
	else
		overlays += image(icon, dir, icon_state = "lid-down")

/obj/machinery/disposal/toilet/attack_hand(mob/living/user as mob)
	if(swirlie)
		usr.visible_message("<span class='danger'>[user] slams the toilet seat onto [swirlie.name]'s head!</span>", "<span class='notice'>You slam the toilet seat onto [swirlie.name]'s head!</span>", "You hear reverberating porcelain.")
		swirlie.adjustBruteLoss(8)
		return

	if(cistern_open && !open)
		if(!contents.len)
			to_chat(user, "<span class='notice'>The cistern is empty.</span>")
			return
		else
			var/obj/item/I = pick(contents)
			if(ishuman(user))
				user.put_in_hands(I)
			else
				I.loc = get_turf(src)
			to_chat(user, "<span class='notice'>You find \an [I] in the cistern.</span>")
			w_items -= I.w_class
			return

	open = !open
	update_icon()

/obj/machinery/disposal/toilet/attackby(obj/item/I as obj, mob/living/user as mob)

	if(istype(I, /obj/item/weapon/crowbar))	//removing/replacing the cistern lid.

		if(cistern_open)
			to_chat(user, "<span class='notice'>You start to replace the lid on the cistern.</span>")
		else
			to_chat(user, "<span class='notice'>You start to lift the lid off the cistern.</span>")
		playsound(loc, 'sound/effects/stonedoor_openclose.ogg', 50, 1)

		if(do_after(user, 30, src))

			if(cistern_open)
				user.visible_message("<span class='notice'>[user] replaces the lid on the cistern!</span>", "<span class='notice'>You replace the lid on the cistern!</span>", "You hear grinding porcelain.")
			else
				user.visible_message("<span class='notice'>[user] lifts the lid off the cistern!</span>", "<span class='notice'>You lift the lid off the cistern!</span>", "You hear grinding porcelain.")

			cistern_open = !cistern_open
			update_icon()
			return

	if(istype(I, /obj/item/weapon/grab))	//giving players swirlies.
		var/obj/item/weapon/grab/G = I

		if(isliving(G.affecting))
			var/mob/living/GM = G.affecting

			if(G.state>1)
				if(!GM.loc == get_turf(src))
					to_chat(user, "<span class='notice'>[GM.name] needs to be on the toilet.</span>")
					return
				if(open && !swirlie)
					user.visible_message("<span class='danger'>[user] starts to give [GM.name] a swirlie!</span>", "<span class='notice'>You start to give [GM.name] a swirlie!</span>")
					swirlie = GM
					if(do_after(user, 30, src))
						user.visible_message("<span class='danger'>[user] gives [GM.name] a swirlie!</span>", "<span class='notice'>You give [GM.name] a swirlie!</span>", "You hear a toilet flushing.")
						GM.adjustOxyLoss(1)
					swirlie = null
				//else
				//	user.visible_message("<span class='danger'>[user] slams [GM.name] into the [src]!</span>", "<span class='notice'>You slam [GM.name] into the [src]!</span>")
				//	GM.adjustBruteLoss(8)
			else
				to_chat(user, "<span class='notice'>You need a tighter grip.</span>")

	if(istype(user,/mob/living/silicon/robot))	//robots cant stick their modules in.
		return

	if(cistern_open)	//objects inserted in the cistern.
		if(I.w_class > ITEM_SIZE_NORMAL)
			to_chat(user, "<span class='notice'>\The [I] does not fit.</span>")
			return
		if(w_items + I.w_class > 5)
			to_chat(user, "<span class='notice'>The cistern is full.</span>")
			return
		user.drop_item()
		I.loc = src
		w_items += I.w_class
		to_chat(user, "You carefully place \the [I] into the cistern.")
		return

	//deconstruction part 1 (required because toilets don't have a control panel)
	if(istype(I, /obj/item/weapon/screwdriver))
		if(mode >= DISPOSAL_CHARGING) // It's on
			if(contents.len > 0)
				to_chat(user, "You start emptying the content of \the [src]... gross.")
				if(do_after(user,20, src))
					eject()
				else
					return

			mode = DISPOSAL_DISCONNECTED
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			to_chat(user, "You remove the screws around the power connection.")
			return
		else if(mode == DISPOSAL_DISCONNECTED)
			mode = DISPOSAL_CHARGING
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			to_chat(user, "You attach the screws around the power connection.")
			return

	var/obj/item/weapon/grab/G = I
	if(istype(G))
		return	//no inserting mob into this

	if(mode == DISPOSAL_DISCONNECTED) //no inserting things into a disconnected toilet (because it is being deconstructed)
		to_chat(user, "\The [src]'s power connection is unscrewed.")
		return

	//All other objects inserted into the toilets & deconstruction part 2.
	..()

/obj/machinery/disposal/toilet/interact(mob/user)
	return

/obj/machinery/disposal/toilet/Topic(href, href_list)
	return

/obj/machinery/disposal/toilet/CanInsertItem(var/mob/living/user=null)
	if(mode == DISPOSAL_DISCONNECTED)
		if(user)
			to_chat(user, "\The [src] overflows!")
		return 0
	if(!open)
		if(user)
			to_chat(user, "\The [src]'s seat is down!")
		return 0
	return ..(user)