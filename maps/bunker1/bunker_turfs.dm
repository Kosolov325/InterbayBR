/turf/simulated/floor/snow/bunker
	temperature = 220 //Enough to deal cold damage on breathing. TODO : Make these points defines

/turf/simulated/floor/snow/bunker/New()
	..()
	icon_state = "snow[rand(0,12)]"

/turf/simulated/floor/snow/bunker/dirt
	name = "dirt"
	icon_state = "wground1"
	temperature = 220 //Enough to deal cold damage on breathing. TODO : Make these points defines

/turf/simulated/floor/snow/bunker/dirt/New()
	..()
	icon_state = "wground[rand(1,3)]"
