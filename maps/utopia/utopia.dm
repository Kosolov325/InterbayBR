#if !defined(USING_MAP_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "utopia_announcements.dm"
	#include "utopia_areas.dm"


	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"
	#include "utopia_gamemodes.dm"
	#include "utopia_presets.dm"
	#include "utopia_shuttles.dm"

	#include "utopia-1.dmm"
	#include "utopia-2.dmm"
	#include "utopia-3.dmm"
	#include "utopia-4.dmm"
	#include "utopia-5.dmm"
	#include "utopia-6.dmm"

	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/utopia

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Utopia
#endif
