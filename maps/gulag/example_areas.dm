/area/constructionsite
	name = "\improper Construction Site"
	icon_state = "storage"

/area/maintenance/fsmaint2
	name = "\improper Fore Starboard Maintenance - 2"
	icon_state = "fsmaint"

/area/gulag
	name = "\improper Gulag"
	icon_state = "storage"
	forced_ambience = list('sound/ambience/ambigulag.ogg')
	base_turf = /turf/simulated/floor/snow/gulag
	has_hum = 0


/area/gulag/maint
	forced_ambience = list('sound/ambience/ambigulagmaint.ogg')
	icon_state = "fsmaint"

/area/gulag/snow
	forced_ambience = list('sound/ambience/ambisnow.ogg')
	icon_state = "space"

/area/supply/dock
    name = "Supply Shuttle"
    icon_state = "shuttle3"
    requires_power = 0