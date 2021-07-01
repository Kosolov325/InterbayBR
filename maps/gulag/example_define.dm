
/datum/map/gulag
	name = "Example"
	full_name = "The Example"
	path = "example"
	station_name = null

	lobby_icon = 'maps/example/example_lobby.dmi'

	station_levels = list(1,2)
	contact_levels = list(1,2)
	player_levels = list(1,2)
	base_turf_by_z = list("1" = /turf/simulated/floor/snow/gulag,"2" = /turf/simulated/open)

	allowed_spawns = list("Arrivals Shuttle")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"

/datum/map/gulag/New()
	..()
	station_name = "Gulag [rand(1,500)]"