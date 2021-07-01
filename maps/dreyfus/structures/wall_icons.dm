/turf/simulated/wall/update_icon()
	..()
	if(!material)
		return

	if(!damage_overlays[1]) //list hasn't been populated
		generate_overlays()

	overlays.Cut()
	var/image/I

	if(!density)
		I = image('maps/dreyfus/icons/turf/wall_masks.dmi', "[material.icon_base]fwall_open")
		I.color = (istype(material, /material/plasteel) || istype(material, /material/steel)) ? "#636769" : material.icon_colour
		overlays += I
		return

	for(var/i = 1 to 4)
		I = image('maps/dreyfus/icons/turf/wall_masks.dmi', "[material.icon_base][wall_connections[i]]", dir = 1<<(i-1))
		I.color = (istype(material, /material/plasteel) || istype(material, /material/steel)) ? "#636769" : material.icon_colour
		overlays += I

	if(reinf_material)
		if(construction_stage != null && construction_stage < 6)
			I = image('maps/dreyfus/icons/turf/wall_masks.dmi', "reinf_construct-[construction_stage]")
			I.color = (istype(reinf_material, /material/plasteel) || istype(reinf_material, /material/steel))  ? "#636769" : reinf_material.icon_colour
			overlays += I
		else
			if("[reinf_material.icon_reinf]0" in icon_states('maps/dreyfus/icons/turf/wall_masks.dmi'))
				// Directional icon
				for(var/i = 1 to 4)
					I = image('maps/dreyfus/icons/turf/wall_masks.dmi', "[reinf_material.icon_reinf][wall_connections[i]]", dir = 1<<(i-1))
					I.color = (istype(reinf_material, /material/plasteel) || istype(reinf_material, /material/steel)) ? "#636769" : reinf_material.icon_colour
					overlays += I
			else
				I = image('maps/dreyfus/icons/turf/wall_masks.dmi', reinf_material.icon_reinf)
				I.color = (istype(reinf_material, /material/plasteel) || istype(reinf_material, /material/steel)) ? "#636769" : reinf_material.icon_colour
				overlays += I

	if(damage != 0)
		var/integrity = material.integrity
		if(reinf_material)
			integrity += reinf_material.integrity

		var/overlay = round(damage / integrity * damage_overlays.len) + 1
		if(overlay > damage_overlays.len)
			overlay = damage_overlays.len

		overlays += damage_overlays[overlay]
	return

/turf/simulated/wall/generate_overlays()
	..()
	var/alpha_inc = 256 / damage_overlays.len

	for(var/i = 1; i <= damage_overlays.len; i++)
		var/image/img = image(icon = 'maps/dreyfus/icons/turf/walls.dmi', icon_state = "overlay_damage")
		img.blend_mode = BLEND_MULTIPLY
		img.alpha = (i * alpha_inc) - 1
		damage_overlays[i] = img