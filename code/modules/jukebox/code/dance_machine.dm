/obj/machinery/jukebox
	name = "jukebox"
	desc = "A classic music player."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "jukebox"
	density = TRUE
	var/active = FALSE
	var/list/rangers = list()
	var/stop = 0
	var/list/songs = list()
	var/datum/track/selection = null
	/// Volume of the songs played
	var/volume = 100

/obj/machinery/jukebox/disco
	name = "radiant dance machine mark IV"
	desc = "The first three prototypes were discontinued after mass casualty incidents."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "disco"
	anchored = FALSE
	var/list/spotlights = list()
	var/list/sparkles = list()

/obj/machinery/jukebox/disco/indestructible
	name = "radiant dance machine mark V"
	desc = "Now redesigned with data gathered from the extensive disco and plasma research."
	anchored = TRUE

/obj/machinery/jukebox/initialize()
	. = ..()
	songs = SSjukeboxes.songs
	if(songs.len)
		selection = pick(songs)

/obj/machinery/jukebox/Destroy()
	return ..()


/obj/machinery/jukebox/ui_status(mob/user)
	if(!anchored)
		return UI_CLOSE
	if(!allowed(user) && !isobserver(user))
		return UI_CLOSE
	if(!SSjukeboxes.songs.len && !isobserver(user))
		return UI_CLOSE
	return ..()

/obj/machinery/jukebox/ui_interact(mob/user, datum/tgui/ui)
	if(!ui)
		ui = new(user, src, "Jukebox", name)
		ui.open()

/obj/machinery/jukebox/ui_data(mob/user)
	var/list/data = list()
	data["active"] = active
	data["songs"] = list()
	for(var/datum/track/S in SSjukeboxes.songs)
		var/list/track_data = list(
			name = S.song_name
		)
		data["songs"] += list(track_data)
	data["track_selected"] = null
	data["track_length"] = null
	data["track_beat"] = null
	if(selection)
		data["track_selected"] = selection.song_name
		data["track_beat"] = selection.song_beat
	data["volume"] = volume
	return data

/obj/machinery/jukebox/ui_act(action, list/params)
	. = ..()
	if(.)
		return

	switch(action)
		if("toggle")
			if(QDELETED(src))
				return
			if(!active)
				if(stop > world.time)
					return
				activate_music()
				return TRUE
			else
				stop = 0
				return TRUE
		if("select_track")
			if(active)
				return
			var/list/available = list()
			for(var/datum/track/S in SSjukeboxes.songs)
				available[S.song_name] = S
			var/selected = params["track"]
			if(QDELETED(src) || !selected || !istype(available[selected], /datum/track))
				return
			selection = available[selected]
			return TRUE
		if("set_volume")
			var/new_volume = params["volume"]
			if(new_volume  == "reset")
				volume = initial(volume)
				return TRUE
			else if(new_volume == "min")
				volume = 0
				return TRUE
			else if(new_volume == "max")
				volume = 100
				return TRUE
			else if(text2num(new_volume) != null)
				volume = text2num(new_volume)
				return TRUE

/obj/machinery/jukebox/proc/activate_music()
	var/jukeboxslottotake = SSjukeboxes.addjukebox(src, selection, 2)
	if(jukeboxslottotake)
		active = TRUE
		update_icon()
		stop = world.time + selection.song_length
		return TRUE
	else
		return FALSE

/obj/machinery/jukebox/disco/activate_music()
	..()

/mob/living/proc/lying_fix()
	animate(src, transform = null, time = 1, loop = 0)
	lying_prev = 0



/obj/machinery/jukebox/process()
	if(active && world.time >= stop)
		active = FALSE
		update_icon()
		stop = world.time + 100
