GLOBAL_LIST_INIT(all_tracks, list(
	new /decl/audio/track/song1,
	new /decl/audio/track/song2,
	new /decl/audio/track/song3,
	new /decl/audio/track/song4,
	new /decl/audio/track/song5,
	new /decl/audio/track/song6
))

/decl/audio/track/custom/New(var/path, var/title_name)
	source = path
	title  = title_name

/decl/audio/track/song1
	source = 'sound/jukebox/barsong1.ogg'
	title = "Song1"

/decl/audio/track/song2
	source = 'sound/jukebox/barsong2.ogg'
	title = "Song2"

/decl/audio/track/song3
	source = 'sound/jukebox/barsong3.ogg'
	title = "Song3"

/decl/audio/track/song4
	source = 'sound/jukebox/barsong4.ogg'
	title = "Song4"

/decl/audio/track/song5
	source = 'sound/jukebox/barsong5.ogg'
	title = "Song5"

/decl/audio/track/song6
	source = 'sound/jukebox/barsong6.ogg'
	title = "Song6"