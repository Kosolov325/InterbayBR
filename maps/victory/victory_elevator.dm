/obj/turbolift_map_holder/victory
	icon = 'icons/obj/turbolift_preview_3x3.dmi'
	depth = 4
	lift_size_x = 4
	lift_size_y = 4

/obj/turbolift_map_holder/victory/freight_elevator
	name = "Victory turbolift map placeholder"
	dir = EAST
	areas_to_use = list(
		/area/turbolift/cargo_station,
		/area/turbolift/cargo_maintenance
		)

/obj/turbolift_map_holder/victory/main_elevator
	name = "Victory turbolift map placeholder"
	dir = NORTH
	areas_to_use = list(
		/area/turbolift/main1,
		/area/turbolift/main2,
		/area/turbolift/main3,
		/area/turbolift/main4
		)