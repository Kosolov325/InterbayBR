// Disposal pipe construction
// This is the pipe that you drag around, not the attached ones.

/obj/structure/disposalconstruct

	name = "disposal pipe segment"
	desc = "A huge pipe segment used for constructing disposal systems."
	icon = 'icons/obj/pipes/disposal.dmi'
	icon_state = "conpipe-s"
	anchored = 0
	density = 0
	matter = list(DEFAULT_WALL_MATERIAL = 1850)
	level = 2
	var/sortType = ""
	var/ptype = DISPOSAL_STRAIGHT
	var/subtype = 0
	var/dpdir = 0	// directions as disposalpipe
	var/base_state = "pipe-s"

// update iconstate and dpdir due to dir and type
/obj/structure/disposalconstruct/proc/update()
	var/flip = turn(dir, 180)
	var/left = turn(dir, 90)
	var/right = turn(dir, -90)

	switch(ptype)
		if(DISPOSAL_STRAIGHT)
			base_state = "pipe-s"
			dpdir = dir | flip
		if(DISPOSAL_CORNER)
			base_state = "pipe-c"
			dpdir = dir | right
		if(DISPOSAL_3WAY)
			base_state = "pipe-j1"
			dpdir = dir | right | flip
		if(DISPOSAL_3WAY_FLIP)
			base_state = "pipe-j2"
			dpdir = dir | left | flip
		if(DISPOSAL_3WAY_Y)
			base_state = "pipe-y"
			dpdir = dir | left | right
		if(DISPOSAL_TRUNK)
			base_state = "pipe-t"
			dpdir = dir
		if(DISPOSAL_BIN) // disposal bin has only one dir, thus we don't need to care about setting it
			if(anchored)
				base_state = "disposal"
			else
				base_state = "condisposal"
			set_density(1)
		if(DISPOSAL_OUTLET)
			base_state = "outlet"
			dpdir = dir
			set_density(1)
		if(DISPOSAL_CHUTE)
			base_state = "intake"
			dpdir = dir
			set_density(1)
		if(DISPOSAL_SORTER)
			base_state = "pipe-j1s"
			dpdir = dir | right | flip
		if(DISPOSAL_SORTER_FLIP)
			base_state = "pipe-j2s"
			dpdir = dir | left | flip
		if(DISPOSAL_UP)
			base_state = "pipe-u"
			dpdir = dir
		if(DISPOSAL_DOWN)
			base_state = "pipe-d"
			dpdir = dir
		if(DISPOSAL_TAG)
			base_state = "pipe-tagger"
			dpdir = dir | flip
		if(DISPOSAL_TAG_PARTIAL)
			base_state = "pipe-tagger-partial"
			dpdir = dir | flip
		if(DISPOSAL_DIVERSION)
			base_state = "pipe-j1s"
			dpdir = dir | flip
		if(DISPOSAL_TOILET)
			base_state = "toilet"

	switch(ptype)
		if(DISPOSAL_BIN,DISPOSAL_OUTLET,DISPOSAL_CHUTE,DISPOSAL_UP,DISPOSAL_DOWN,DISPOSAL_TAG,DISPOSAL_TAG_PARTIAL,DISPOSAL_DIVERSION)
			icon_state = base_state
		if(DISPOSAL_TOILET)
			icon = 'icons/obj/machines/toilets.dmi'
			icon_state = "base"
		else
			icon_state = "con[base_state]"

	if(invisibility)	// if invisible, fade icon
		alpha = 128
	else				//otherwise burying half-finished pipes under floors causes them to half-fade
		alpha = 255

// hide called by levelupdate if turf intact status changes
// change visibility status and force update of icon
/obj/structure/disposalconstruct/hide(var/intact)
	invisibility = (intact && level==1) ? 101: 0	// hide if floor is intact
	update()


// flip and rotate verbs
/obj/structure/disposalconstruct/verb/rotate()
	set category = "Object"
	set name = "Rotate Pipe"
	set src in view(1)

	if(usr.stat)
		return

	if(anchored)
		to_chat(usr, "You must unfasten the pipe before rotating it.")
		return

	set_dir(turn(dir, -90))
	update()

/obj/structure/disposalconstruct/verb/flip()
	set category = "Object"
	set name = "Flip Pipe"
	set src in view(1)
	if(usr.stat)
		return

	if(anchored)
		to_chat(usr, "You must unfasten the pipe before flipping it.")
		return

	set_dir(turn(dir, 180))
	switch(ptype)
		if(DISPOSAL_3WAY)
			ptype = DISPOSAL_3WAY_FLIP
		if(DISPOSAL_3WAY_FLIP)
			ptype = DISPOSAL_3WAY
		if(DISPOSAL_SORTER)
			ptype = DISPOSAL_SORTER_FLIP
		if(DISPOSAL_SORTER_FLIP)
			ptype = DISPOSAL_SORTER
	update()

// returns the type path of disposalpipe corresponding to this item dtype
/obj/structure/disposalconstruct/proc/dpipetype()
	switch(ptype)
		if(DISPOSAL_STRAIGHT,DISPOSAL_CORNER)
			return /obj/structure/disposalpipe/segment
		if(DISPOSAL_3WAY,DISPOSAL_3WAY_FLIP,DISPOSAL_3WAY_Y)
			return /obj/structure/disposalpipe/junction
		if(DISPOSAL_TRUNK)
			return /obj/structure/disposalpipe/trunk
		if(DISPOSAL_SORTER)
			switch(subtype)
				if(SORTER_TYPE_NORMAL)
					return /obj/structure/disposalpipe/sortjunction
				if(SORTER_TYPE_WILDCARD)
					return /obj/structure/disposalpipe/sortjunction/wildcard
				if(SORTER_TYPE_UNTAGGED)
					return /obj/structure/disposalpipe/sortjunction/untagged
		if(DISPOSAL_SORTER_FLIP)
			switch(subtype)
				if(SORTER_TYPE_NORMAL)
					return /obj/structure/disposalpipe/sortjunction/flipped
				if(SORTER_TYPE_WILDCARD)
					return /obj/structure/disposalpipe/sortjunction/wildcard/flipped
				if(SORTER_TYPE_UNTAGGED)
					return /obj/structure/disposalpipe/sortjunction/untagged/flipped
		if(DISPOSAL_UP)
			return /obj/structure/disposalpipe/up
		if(DISPOSAL_DOWN)
			return /obj/structure/disposalpipe/down
		if(DISPOSAL_TAG)
			return /obj/structure/disposalpipe/tagger
		if(DISPOSAL_TAG_PARTIAL)
			return /obj/structure/disposalpipe/tagger/partial
		if(DISPOSAL_DIVERSION)
			return /obj/structure/disposalpipe/diversion_junction
	return



// attackby item
// wrench: (un)anchor
// weldingtool: convert to real pipe
/obj/structure/disposalconstruct/attackby(var/obj/item/I, var/mob/user)
	var/nicetype
	src.add_fingerprint(user)
	switch(ptype)
		if(DISPOSAL_BIN)
			nicetype = "disposal bin"
		if(DISPOSAL_OUTLET)
			nicetype = "disposal outlet"
		if(DISPOSAL_CHUTE)
			nicetype = "delivery chute"
		if(DISPOSAL_SORTER,DISPOSAL_SORTER_FLIP)
			nicetype = "sorting  pipe"
			if(subtype == SORTER_TYPE_WILDCARD)
				nicetype = "wildcard sorting  pipe"
			else if(subtype == SORTER_TYPE_UNTAGGED)
				nicetype = "untagged sorting  pipe"
		if(DISPOSAL_TAG)
			nicetype = "tagging pipe"
		if(DISPOSAL_TAG_PARTIAL)
			nicetype = "partial tagging pipe"
		if(DISPOSAL_TOILET)
			nicetype = "toilet"
		else
			nicetype = "pipe"

	var/turf/T = src.loc
	if(!T.is_plating())
		to_chat(user, "You can only attach the [nicetype] if the floor plating is removed.")
		return

	var/obj/structure/disposalpipe/CP = locate() in T

	if(istype(I, /obj/item/weapon/wrench))
		if(anchored)
			anchored = 0
			if(is_pipe())
				level = 2
				set_density(0)
			else
				set_density(1)
			to_chat(user, "You detach the [nicetype] from the underfloor.")
		else
			if(!is_pipe())
				if(CP) // There's something there
					if(!istype(CP,/obj/structure/disposalpipe/trunk))
						to_chat(user, "The [nicetype] requires a trunk underneath it in order to work.")
						return
				else // Nothing under, fuck.
					to_chat(user, "The [nicetype] requires a trunk underneath it in order to work.")
					return
			else
				if(CP)
					update()
					var/pdir = CP.dpdir
					if(istype(CP, /obj/structure/disposalpipe/broken))
						pdir = CP.dir
					if(pdir & dpdir)
						to_chat(user, "There is already a [nicetype] at that location.")
						return

			anchored = 1

			if(is_pipe())
				level = 1 		// We don't want disposal bins to disappear under the floors
				set_density(0)
			else if(ptype == DISPOSAL_TOILET)
				set_density(0)
			else
				set_density(1)	// We don't want disposal bins or outlets to go density 0

			to_chat(user, "You attach the [nicetype] to the underfloor.")
		playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
		update()

	else if(istype(I, /obj/item/weapon/weldingtool))
		if(anchored)
			var/obj/item/weapon/weldingtool/W = I
			if(W.remove_fuel(0,user))
				playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
				to_chat(user, "Welding the [nicetype] in place.")
				if(do_after(user, 20, src))
					if(!src || !W.isOn()) return
					to_chat(user, "The [nicetype] has been welded in place!")
					update() // TODO: Make this neat

					if(is_pipe())
						var/pipetype = dpipetype()
						var/obj/structure/disposalpipe/P = new pipetype(src.loc)
						src.transfer_fingerprints_to(P)
						P.base_icon_state = base_state
						P.set_dir(dir)
						P.dpdir = dpdir
						P.updateicon()

						//Needs some special treatment ;)
						if(ptype==DISPOSAL_SORTER || ptype==DISPOSAL_SORTER_FLIP)
							var/obj/structure/disposalpipe/sortjunction/SortP = P
							SortP.sortType = sortType
							SortP.updatedir()
							SortP.updatedesc()
							SortP.updatename()

					else if(ptype==DISPOSAL_BIN)
						var/obj/machinery/disposal/P = new /obj/machinery/disposal(src.loc)
						src.transfer_fingerprints_to(P)
						P.mode = -1 // start with pump off, it still need to be screwed to power and turned on

					else if(ptype==DISPOSAL_TOILET)
						var/obj/machinery/disposal/P = new /obj/machinery/disposal/toilet(src.loc)
						src.transfer_fingerprints_to(P)
						P.mode = -1 // start with pump off, it still need to be screwed to power and turned on

					else if(ptype==DISPOSAL_OUTLET)
						var/obj/structure/disposaloutlet/P = new /obj/structure/disposaloutlet(src.loc)
						src.transfer_fingerprints_to(P)
						P.set_dir(dir)
						var/obj/structure/disposalpipe/trunk/Trunk = CP
						Trunk.linked = P

					else if(ptype==DISPOSAL_CHUTE)
						var/obj/machinery/disposal/deliveryChute/P = new /obj/machinery/disposal/deliveryChute(src.loc)
						src.transfer_fingerprints_to(P)
						P.set_dir(dir)

					qdel(src)
					return
			else
				to_chat(user, "You need more welding fuel to complete this task.")
				return
		else
			to_chat(user, "You need to attach it to the plating first!")
			return

/obj/structure/disposalconstruct/hides_under_flooring()
	if(anchored)
		return 1
	else
		return 0

//Tells us if the object is a pipe and must be be hidden under the floor.
/obj/structure/disposalconstruct/proc/is_pipe()
	switch(ptype)
		if(DISPOSAL_BIN,DISPOSAL_OUTLET,DISPOSAL_CHUTE,DISPOSAL_TOILET)
			return 0
	return 1
