#if !defined(USING_MAP_DATUM)
	#include "bunker_areas.dm"

	#include "bunker_unit_testing.dm"

	#include "bunker-1.dmm"
	#include "bunker-2.dmm"
	#include "bunker-3.dmm"
	#include "bunker-4.dmm"
	#include "bunker-5.dmm"

	#include "bunker_jobs.dm"
	#include "card_ids.dm"

	#include "bunker_turfs.dm"

	#include "bunker_shuttles.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/bunker

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif
