
/datum/map/utopia
	name = "Utopia"
	full_name = "Space Station Utopia"
	path = "utopia"

	lobby_icon = 'maps/utopia/utopia_lobby.dmi'

	station_levels = list(1,2,3,4)
	admin_levels = list(5)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4,6)
	accessible_z_levels = list("1"=1,"2"=1,"3"=1,"4"=1,"6"=90) //Percentage of chance to get on this or that Z level as you drift through space.

	allowed_spawns = list("Arrivals Shuttle")

	station_name  = "Space Station Utopia"
	station_short = "Utopia"
	dock_name     = "NTTM1-54 Relay"
	boss_name     = "Colonial Magistrate Council"
	boss_short    = "Council"
	company_name  = "Colonial Magistrate Authority"
	company_short = "CMA"
	system_name = "somewhere in space"

	id_hud_icons = 'maps/dreyfus/icons/assignment_hud.dmi'


	map_admin_faxes = list("Colonial Magistrate Authority")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"

	evac_controller_type = /datum/evacuation_controller/shuttle


/datum/map/utopia/perform_map_generation()
	new /datum/random_map/automata/cave_system(null,1,1,3,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,3,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,2,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,4,64, 64)
	new /datum/random_map/automata/cave_system(null,1,1,1,255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null,1,1,2,64, 64)
	return 1