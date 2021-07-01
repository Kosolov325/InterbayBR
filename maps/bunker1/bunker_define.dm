
/datum/map/bunker
	name = "Bunker"
	full_name = "The Bunker"
	path = "bunker"
	station_name = null

	lobby_icon = 'maps/bunker1/bunker_lobby.dmi'

	station_levels = list(1,2,3,4)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)
	base_turf_by_z = list("1" = /turf/simulated/floor/snow/bunker/dirt,"2" = /turf/simulated/open, "3" = /turf/simulated/open, "4" = /turf/simulated/floor/snow/bunker)

	allowed_spawns = list("Arrivals Shuttle")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"

/datum/map/bunker/New()
	..()
	station_name = "Bunker [rand(1,25)]"

/datum/map/bunker/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, 2, 150, 150) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 2, 64, 64)         // Create the mining ore distribution map.
	new /datum/random_map/automata/cave_system(null, 1, 1, 1, 150, 150) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 1, 64, 64)         // Create the mining ore distribution map.
	return 1