/area/constructionsite
	name = "\improper Construction Site"
	icon_state = "storage"

/area/maintenance/fsmaint2
	name = "\improper Fore Starboard Maintenance - 2"
	icon_state = "fsmaint"

/area/bunker
	name = "\improper Bunker"
	icon_state = "storage"
	forced_ambience = list('sound/ambience/ambigulag.ogg')
	base_turf = /turf/simulated/floor/snow/bunker
	has_hum = 0


/area/bunker/maint
	forced_ambience = list('sound/ambience/ambigulagmaint.ogg')
	icon_state = "fsmaint"

/area/bunker/snow
	forced_ambience = list('sound/ambience/ambisnow.ogg')
	icon_state = "space"

/area/supply/dock
    name = "Supply Shuttle"
    icon_state = "shuttle3"
    requires_power = 0