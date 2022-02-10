/decl/audio
	var/source //Path to file source
	var/display //A display title we use in the game
	var/volume //If present, a `normal` volume
	var/title //The real title
	var/author
	var/collection
	var/decl/license/license
	var/url


//Repository scopes
/decl/audio/effect
/decl/audio/track


/decl/audio/New()
	. = ..()


/decl/audio/VV_static()
	return ..() + vars

/decl/audio/proc/get_sound(channel)
	var/sound/S = sound(source, FALSE, FALSE, channel, volume || 100)
	return S