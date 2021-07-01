/obj/item/stack/tile
	icon = 'maps/dreyfus/icons/items.dmi'

/obj/item/stack/tile/carpet
	name = "carpet"
	singular_name = "carpet"
	desc = "A piece of carpet. It is the same size as a normal floor tile!"
	icon_state = "tile-carpet"

/obj/item/stack/tile/carpet/bcarpet
	icon_state = "tile-bcarpet"
/obj/item/stack/tile/carpet/blucarpet
	icon_state = "tile-blucarpet"
/obj/item/stack/tile/carpet/turcarpet
	icon_state = "tile-turcarpet"
/obj/item/stack/tile/carpet/sblucarpet
	icon_state = "tile-sblucarpet"
/obj/item/stack/tile/carpet/gaycarpet
	icon_state = "tile-gaycarpet"
/obj/item/stack/tile/carpet/purcarpet
	icon_state = "tile-purcarpet"
/obj/item/stack/tile/carpet/oracarpet
	icon_state = "tile-oracarpet"

/obj/item/stack/tile/floor
	name = "floor tile"
	singular_name = "floor tile"
	desc = "Those could work as a pretty decent throwing weapon" //why?
	icon_state = "tile"
	throw_speed = 5
	throw_range = 20
	flags = CONDUCT

/obj/item/stack/tile/floor/techgrey
	name = "grey techfloor tile"
	singular_name = "grey techfloor tile"
	icon_state = "techtile_grey"

/obj/item/stack/tile/floor/techgrid
	name = "grid techfloor tile"
	singular_name = "grid techfloor tile"
	icon_state = "techtile_grid"

/obj/item/stack/tile/floor/steel
	name = "steel floor tile"
	singular_name = "steel floor tile"
	icon_state = "tile_steel"
	matter = list("plasteel" = 937.5)

/obj/item/stack/tile/floor/white
	name = "white floor tile"
	singular_name = "white floor tile"
	icon_state = "tile_white"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor/dark
	name = "dark floor tile"
	singular_name = "dark floor tile"
	icon_state = "fr_tile"
	matter = list("plasteel" = 937.5)

/obj/item/stack/tile/floor/freezer
	name = "freezer floor tile"
	singular_name = "freezer floor tile"
	icon_state = "tile_freezer"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor/cyborg
	name = "floor tile synthesizer"
	desc = "A device that makes floor tiles."
	gender = NEUTER
	matter = null
	uses_charge = 1
	charge_costs = list(250)
	stacktype = /obj/item/stack/tile/floor
	build_type = /obj/item/stack/tile/floor

/obj/item/stack/tile/linoleum
	name = "linoleum"
	singular_name = "linoleum"
	desc = "A piece of linoleum. It is the same size as a normal floor tile!"
	icon_state = "tile-linoleum"