#if !defined(USING_MAP_DATUM)
	#include "warfare_areas.dm"
	#include "warfare_shuttles.dm"
	#include "warfare_unit_testing.dm"

	#include "warfare-1.dmm"
	#include "warfare-2.dmm"

	#include "warfare_objs.dm"

	#include "warfare_jobs.dm"

	#include "../../code/modules/lobby_music/absconditus.dm"

	#define USING_MAP_DATUM /datum/map/warfare

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif
