/obj/item/weapon/storage/briefcase
	name = "briefcase"
	desc = "It's made of AUTHENTIC faux-leather and has a price-tag still attached. Its owner must be a real professional."
	icon_state = "briefcase"
	item_state = "briefcase"
	flags = CONDUCT
	force = 8.0
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_BACKPACK_STORAGE

/obj/item/weapon/storage/briefcase/drugs
	name = "dealer briefcase"
	desc = "A stainless steel-plated carrycase for all your illegal needs. Feels heavy."
	icon_state = "briefcase"
	item_state = "briefcase"
	startswith = list(
		/obj/item/weapon/reagent_containers/syringe/drugs,
		/obj/item/weapon/reagent_containers/syringe/drugs,
		/obj/item/weapon/reagent_containers/syringe/drugs,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/flame/lighter/zippo,
		/obj/item/weapon/material/butterfly/switchblade,
		)
