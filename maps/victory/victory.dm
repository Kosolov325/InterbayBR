#if !defined(USING_MAP_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "victory_announcements.dm"
	#include "victory_areas.dm"


	//CONTENT
	#include "job/jobs.dm"
	#include "datums/uniforms.dm"
	#include "items/cards_ids.dm"
	#include "victory_gamemodes.dm"
	#include "victory_presets.dm"
	#include "victory_shuttles.dm"
	#include "victory_elevator.dm"

	#include "victory-1.dmm"
	#include "victory-2.dmm"
	#include "victory-3.dmm"
	#include "victory-4.dmm"
	#include "victory-5.dmm"

	#include "items/booth.dm"
	#include "items/cards_ids.dm"
	#include "items/papers.dm"
	#include "items/storage.dm"

	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/victory

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Victory
#endif
