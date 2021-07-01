#if !defined(USING_MAP_DATUM)

	#include "../shared/exodus_torch/_include.dm"

	#include "dreyfus_announcements.dm"
	#include "dreyfus_areas.dm"
	#include "dreyfus_elevator.dm"
	//#include "dreyfus_ranks.dm"
	#include "dreyfus_presets.dm"
	#include "dreyfus_shuttles.dm"
	#include "dreyfus_effects.dm"


	//CONTENT
	#include "../shared/job/jobs.dm"
	#include "../shared/datums/uniforms.dm"
	#include "../shared/items/cards_ids.dm"
	#include "../shared/items/clothing.dm"

	#include "items/papers.dm"
	//#include "structures/airlock.dm"
	//#include "structures/blast_door.dm"
	#include "structures/catwalk.dm"
	//#include "structures/closet.dm"
	#include "structures/curtains.dm"
	#include "structures/flooring.dm"
	#include "structures/flooring_decals.dm"
	#include "structures/flooring_premades.dm"
	#include "structures/furniture.dm"
	#include "structures/gym.dm"
	#include "structures/tile_types.dm"
	//#include "structures/wall_icons.dm"
	#include "structures/walls.dm"
	#include "structures/machinery.dm"
	#include "structures/railing.dm"
	#include "structures/shelf.dm" //Abruti
	#include "dreyfus_gamemodes.dm"

	#include "dreyfus-01.dmm" // - Abandonné - IA(?), traitement des déchets
	#include "dreyfus-02.dmm" // - Ingénierie - Moteur. Lifesupport.
	#include "dreyfus-03.dmm" // - Cargo - Ouvrier, Production et logistique
	#include "dreyfus-04.dmm" // - Résidentiel - Clinique, bar et good vibes
	#include "dreyfus-05.dmm" // - Bureaux - Personnel administratif et direction
	#include "dreyfus-06.dmm" // - Coupole - Jardin, réception des invités
	#include "dreyfus-07.dmm"
	#include "dreyfus-08.dmm"

	#include "../shared/exodus_torch/_include.dm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define USING_MAP_DATUM /datum/map/dreyfus

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Dreyfus
#endif
