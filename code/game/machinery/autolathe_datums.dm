/var/global/list/autolathe_recipes
/var/global/list/autolathe_categories

/proc/populate_lathe_recipes()

	//Create global autolathe recipe list if it hasn't been made already.
	autolathe_recipes = list()
	autolathe_categories = list()
	for(var/R in typesof(/datum/autolathe/recipe)-/datum/autolathe/recipe)
		var/datum/autolathe/recipe/recipe = new R
		autolathe_recipes += recipe
		autolathe_categories |= recipe.category

		var/obj/item/I = new recipe.path
		if(I.matter && !recipe.resources) //This can be overidden in the datums.
			recipe.resources = list()
			for(var/material in I.matter)
				recipe.resources[material] = I.matter[material]*1.25 // More expensive to produce than they are to recycle.
		qdel(I)

/datum/autolathe/recipe
	var/name = "object"
	var/path
	var/list/resources
	var/hidden
	var/category
	var/power_use = 0
	var/is_stack

/datum/autolathe/recipe/flashlight
	name = "flashlight"
	path = /obj/item/device/flashlight
	category = "General"

/datum/autolathe/recipe/zipgunframe
	name = "zipgun frame"
	path = /obj/item/weapon/zipgunframe
	category = "General"

/datum/autolathe/recipe/pipe
	name = "pipe"
	path = /obj/item/pipe
	category = "General"

/datum/autolathe/recipe/tape_roll
	name = "Tape roll"
	path = /obj/item/weapon/tape_roll
	category = "General"

/datum/autolathe/recipe/mouse_trap
	name = "Mouse trap"
	path = /obj/item/device/assembly/mousetrap
	category = "General"

/datum/autolathe/recipe/reciever
	name = "reciever"
	path = /obj/item/reciever
	category = "General"

/datum/autolathe/recipe/stock
	name = "stock"
	path = /obj/item/stock
	category = "General"
