/var/global/list/metal_lathe_recipes
/var/global/list/metal_lathe_categories

/proc/populate_metal_lathe_recipes()

	//Create global metal_lathe recipe list if it hasn't been made already.
	metal_lathe_recipes = list()
	metal_lathe_categories = list()
	for(var/R in typesof(/datum/metal_lathe/recipe)-/datum/metal_lathe/recipe)
		var/datum/metal_lathe/recipe/recipe = new R
		metal_lathe_recipes += recipe
		metal_lathe_categories |= recipe.category

		var/obj/item/I = new recipe.path
		if(I.matter && !recipe.resources) //This can be overidden in the datums.
			recipe.resources = list()
			for(var/material in I.matter)
				recipe.resources[material] = I.matter[material]*1.25 // More expensive to produce than they are to recycle.
		qdel(I)

/datum/metal_lathe/recipe
	var/name = "object"
	var/path
	var/list/resources
	var/hidden
	var/category
	var/power_use = 0
	var/is_stack

/datum/metal_lathe/recipe/reciever
	name = "Reciever"
	path = /obj/item/reciever
	category = "General"

/datum/metal_lathe/recipe/action
	name = "Action"
	path = /obj/item/action
	category = "General"

/datum/metal_lathe/recipe/metal_bar
	name = "Metal Bar"
	path = /obj/item/metal_bar
	category = "General"

/datum/metal_lathe/recipe/cylinder
	name = "Cylinder"
	path = /obj/item/cylinder
	category = "General"

/datum/metal_lathe/recipe/metal_shiv
	name = "Metal Shiv"
	path = /obj/item/metal_shiv
	category = "General"

/datum/metal_lathe/recipe/glass_handle
	name = "Glass Handle"
	path = /obj/item/glass_handle
	category = "General"

/datum/metal_lathe/recipe/glass_bar
	name = "Glass Bar"
	path = /obj/item/glass_bar
	category = "General"

/datum/metal_lathe/recipe/wire
	name = "Cable coil"
	path = /obj/item/stack/cable_coil/30
	category = "General"

/datum/metal_lathe/recipe/fork
	name = "Fork"
	path = /obj/item/weapon/material/kitchen/utensil/fork
	category = "General"

/datum/metal_lathe/recipe/spoon
	name = "Spoon"
	path = /obj/item/weapon/material/kitchen/utensil/spoon
	category = "General"

/datum/metal_lathe/recipe/knife
	name = "Knife"
	path = /obj/item/weapon/material/kitchen/utensil/knife
	category = "General"

/datum/metal_lathe/recipe/ring
	name = "Ring"
	path = /obj/item/clothing/ring/material
	category = "General"

/datum/metal_lathe/recipe/knife_handle
	name = "Knife Handle"
	path = /obj/item/weapon/material/butterflyhandle
	category = "General"

/datum/metal_lathe/recipe/knife_blade
	name = "Knife Blade"
	path = /obj/item/weapon/material/butterflyblade
	category = "General"
