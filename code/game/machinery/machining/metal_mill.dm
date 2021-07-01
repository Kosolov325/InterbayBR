/obj/machinery/metal_mill
	name = "Mill"
	desc = "It mills metal.  Use it to make holes in things.."
	icon_state = "mill"
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 2000
	clicksound = "keyboard"
	clickvol = 30
	var/obj/item/inserted_object = null
	var/show_category = "All"


	var/busy = 0
	var/disabled = 0

	var/mat_efficiency = 1
	var/build_time = 20


/obj/machinery/metal_mill/New()

	..()
	//Create parts for lathe.

/obj/machinery/metal_mill/Destroy()
	return ..()

/obj/machinery/metal_mill/proc/update_recipe_list()
	return

/obj/machinery/metal_mill/interact(mob/user as mob)

	update_recipe_list()

	if(disabled)
		to_chat(user, "<span class='danger'>\The [src] is disabled!</span>")
		return

	if(busy)
		to_chat(usr, "<span class='notice'>The mill is busy. Please wait for completion of previous operation.</span>")
		return

	if(!disabled)
		var/obj/item/making
		if (!busy) //STOP SPAMMING MY EARS GOH GOD
			playsound(src,'sound/mecha/mechdrill.ogg',30,1)
		making = inserted_object
		inserted_object = 0
		busy = 1
		update_use_power(2)
		sleep(build_time)
		busy = 0
		update_use_power(1)

		//Sanity check.
		if(!making || !src) return

		//Mill the item, for better or worse
		var/obj/item/milling= making.mill(user)
		if (!milling)
			if (user.skillcheck(user.engineering_skill, 65, 1, message = "You try to mill the object but it uselessly falls apart.  You don't think this item was meant to be milled.."))
				to_chat(user, "<span class='notice'>The [making] falls out of the mill.  You don't think this item was meant to be milled...</span>")
				new making.type(src.loc)
		else
			new milling(loc)
		//consume object
	//user << browse(dat, "window=metal_mill")
	//onclose(user, "metal_mill")
	busy = 0

//THE OBJECT BEING ADDED IS THE LETTER "O" NOT A 0(ZERO)
/obj/machinery/metal_mill/attackby(var/obj/item/O as obj, var/mob/user as mob)

	if(busy)
		to_chat(user, "<span class='notice'>\The [src] is busy. Please wait for completion of previous operation.</span>")
		return
	/*
	if(default_deconstruction_screwdriver(user, O))
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return
	*/
	if(stat)
		return

	if(O.loc != user && !(istype(O,/obj/item/stack)))
		return 0

	if(istype(O,/obj/item/stack))
		to_chat(user, "<span class='notice'>[O] is too big for the mill!</span>")
		return
	//Resources are being loaded.
	var/obj/item/eating = O
	//You can put ANYTHING in as long as it's not full
	// TODO: needs size check
	if (inserted_object)
		to_chat(user, "<span class='notice'>\The [src] is full. Please remove the object from the mill in order to insert another.</span>")
		return
	else
		inserted_object = eating
		to_chat(user, "You fill \the [src] to capacity with \the [eating].")

	flick("metal_mill_o", src) // Plays metal insertion animation. Work out a good way to work out a fitting animation. ~Z

	user.remove_from_mob(O)
	qdel(O)

	updateUsrDialog()
	return

/obj/machinery/metal_mill/attack_hand(mob/user as mob)
	//user.set_machine(src)
	interact(user)
