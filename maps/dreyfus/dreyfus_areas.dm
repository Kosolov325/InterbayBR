/datum/map/dreyfus

	base_floor_type = /turf/simulated/floor/airless
	base_floor_area = /area/maintenance/exterior

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape_pod1
	)

/area/shuttle/arrival
	name = "\improper Arrival Shuttle"

/area/shuttle/arrival/station
	icon_state = "shuttle"

//Coupole

/area/dreyfus/coupole/corridor
	name = "Dome Hallway"
	icon_state = "hallC1"

/area/dreyfus/coupole/maintenance/
	name = "Dome Maintenance"
	icon_state = "maintcentral"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/coupole/chapelle
	name = "Chapel"
	icon_state = "chapel"

/area/dreyfus/coupole/aumonier
	name = "Priest's Study"
	icon_state = "chapeloffice"

/area/dreyfus/coupole/jardin
	name = "Garden"
	icon_state = "garden"

/area/dreyfus/coupole/conference
	name = "Conference Room"
	icon_state = "observatory"

/area/dreyfus/coupole/solaire/avant/exterieur
	name = "Fore Solar"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space

/area/dreyfus/coupole/solaire/avant/control
	name = "Fore Solar Control"
	icon_state = "SolarcontrolA"

/area/dreyfus/coupole/solaire/arriere/exterieur
	name = "Aft Solar"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space

/area/dreyfus/coupole/solaire/arriere/control
	name = "Aft Solar Control"
	icon_state = "SolarcontrolA"

//Pont administratif

/area/dreyfus/administration/corridor
	name = "Administration Hallway"
	icon_state = "hallC1"

/area/dreyfus/administration/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/administration/maintenance/avant
	name = "Fore Administration Maintenance"
	icon_state = "fmaint"

/area/dreyfus/administration/maintenance/arriere
	name = "Aft Administration Maintenance"
	icon_state = "amaint"

/area/dreyfus/administration/toilettes
	name = "Administration Lavatories"
	icon_state = "toilet"

/area/dreyfus/administration/sec/reception
	name = "Peacekeepers - Lobby"
	icon_state = "security"

/area/dreyfus/administration/sec/vestiaires
	name = "Peacekeepers - Locker Room"
	icon_state = "brig"

/area/dreyfus/administration/sec/cellule
	name = "Peacekeepers - Brig"
	icon_state = "sec_prison"

/area/dreyfus/administration/sec/armurerie
	name = "Peacekeepers - Armory"
	icon_state = "armory"

/area/dreyfus/administration/sec/marshall
	name = "Head Peacekeeper's Office"
	icon_state = "sec_hos"

/area/dreyfus/administration/bureaux/openspace
	name = "Administrative Offices"
	icon_state = "library"

/area/dreyfus/administration/bureaux/executif
	name = "High Administration Offices"
	icon_state = "law"

/area/dreyfus/administration/bureaux/directeur
	name = "Commandant's Quarters"
	icon_state = "captain"


//Pont residentiel

/area/dreyfus/residentiel/dock/corridor
	name = "Arrival Docking Point"
	icon_state = "hallC1"
	sound_env = HALLWAY

/area/dreyfus/residentiel/dock/toilettes
	name = "Arrival Lavatories"
	icon_state = "toilet"
	sound_env = BATHROOM

/area/dreyfus/residentiel/hub/corridor
	name = "Residential Hub Hallway"
	icon_state = "hallC2"
	sound_env = HALLWAY

/area/dreyfus/residentiel/hub/concierge
	name = "Custodial Closet"
	icon_state = "janitor"
	sound_env = SMALL_ENCLOSED

/area/dreyfus/residentiel/sejour/Corridor
	name = "Recreation Hallway"
	icon_state = "hallC3"
	sound_env = HALLWAY

/area/dreyfus/residentiel/sejour/cryo
	name = "Cryogenic Storage"
	icon_state = "cryo"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/sejour/gym
	name = "Gym"
	icon_state = "fitness"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/sejour/cafet
	name = "Cafeteria"
	icon_state = "cafeteria"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/sejour/cuisine
	name = "Kitchen"
	icon_state = "kitchen"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/sejour/vestiaire
	name = "Crew - Locker Room"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/corridor
	name = "Crew - Hallway"
	icon_state = "hallf"
	sound_env = TUNNEL_ENCLOSED

/area/dreyfus/residentiel/quartiers/chambre1
	name = "Crew - Bedroom 1"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/chambre2
	name = "Crew - Bedroom 2"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/quartiers/chambre3
	name = "Crew - Bedroom 3"
	icon_state = "crew_quarters"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/clinique/reception
	name = "Medbay - Reception"
	icon_state = "medbay3"
	sound_env = SMALL_SOFTFLOOR

/area/dreyfus/residentiel/clinique/urgences
	name = "Medbay - Emergency"
	icon_state = "medbay4"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/traitement
	name = "Medbay - Treatment"
	icon_state = "medbay"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/laboratoire
	name = "Medbay - Laboratory"
	icon_state = "medbay2"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/chirurgie
	name = "Medbay - Operating Theater"
	icon_state = "medbay2"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/patients
	name = "Medbay - Patients Room"
	icon_state = "patients"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/vestiaire
	name = "Medbay - Locker Room"
	icon_state = "medbay"
	sound_env = STANDARD_STATION

/area/dreyfus/residentiel/clinique/repos
	name = "Medbay - Break Room"
	icon_state = "medbay2"
	sound_env = MEDIUM_SOFTFLOOR

/area/dreyfus/residentiel/clinique/morgue
	name = "Medbay - Morgue"
	icon_state = "morgue"
	sound_env = SMALL_ENCLOSED

/area/dreyfus/residentiel/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


/area/dreyfus/residentiel/maintenance/avant
	name = "Fore Residential Maintenance"
	icon_state = "fmaint"

/area/dreyfus/residentiel/maintenance/arriere
	name = "Aft Residential Maintenance"
	icon_state = "amaint"


//Pont cargo

/area/dreyfus/cargo/maintenance/babord
	name = "Industrial Zone - Port Maintenance"
	icon_state = "maint_cargo"

/area/dreyfus/cargo/maintenance/tribord
	name = "Industrial Zone - Starboard Maintenance"
	icon_state = "maint_cargo"

/area/dreyfus/cargo/industrie/accueil
	name = "Shipping & Receiving Office"
	icon_state = "conference"

/area/dreyfus/cargo/industrie/entrepot
	name = "Primary Warehouse"
	icon_state = "primarystorage"

/area/dreyfus/cargo/industrie/entrepot/specialise
	name = "Auxiliary Warehouse"
	icon_state = "auxstorage"

/area/dreyfus/cargo/industrie/production
	name = "Fabrication Workshop"
	icon_state = "mining_production"

/area/dreyfus/cargo/industrie/raffinerie
	name = "Refinery"
	icon_state = "mining"

/area/dreyfus/cargo/industrie/bureau_qm
	name = "Quartermaster's Office"
	icon_state = "quartoffice"

/area/dreyfus/cargo/industrie/quartiers
	name = "Crate Pushers Quarters"
	icon_state = "crew_quarters"

/area/dreyfus/cargo/Corridor
	name = "Industrial Sector Hallway"
	icon_state = "hallC1"

/area/dreyfus/cargo/recherche/robotique
	name = "Technomancy - Robotics Workshop"
	icon_state = "robotics"

/area/dreyfus/cargo/recherche/developpement
	name = "Technomancy - Laboratory"
	icon_state = "research"

/area/dreyfus/cargo/recherche/salon
	name = "Technomancy - Break Room"
	icon_state = "research"

/area/dreyfus/cargo/recherche/bureau_rd
	name = "Technomancer's Office"
	icon_state = "quartoffice"

/area/dreyfus/cargo/recherche/labo_xenoarch
	name = "Technomancy - Xenoarcheology Lab"
	icon_state = "xeno_lab"

/area/dreyfus/cargo/recherche/labo_anomalies
	name = "Technomancy - Anomaly Research Lab"
	icon_state = "anomaly"

/area/dreyfus/cargo/industrie/raffinerie/avantposte
	name = "Mining Outpost"
	icon_state = "mining"

/area/dreyfus/cargo/maintenance
	icon_state = "fmaint"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/cargo/industrie/raffinerie/avantposte/solar
	name = "Outpost Solar"
	icon_state = "panelsA"
	flags = AREA_EXTERNAL
	requires_power = 1
	always_unpowered = 1
	has_gravity = FALSE
	base_turf = /turf/space


//Pont ingenierie

/area/dreyfus/ingenierie/moteur/atmos
	name = "Life Support"
	icon_state = "atmos"

/area/dreyfus/ingenierie/moteur
	name = "Generator"
	icon_state = "engine"

/area/dreyfus/ingenierie/moteur/SMES
	name = "Power Storage"
	icon_state = "engine_smes"

/area/dreyfus/ingenierie/moteur/controle
	name = "Generator Control Room"
	icon_state = "engine_monitoring"

/area/dreyfus/ingenierie/moteur/acces
	name = "Generator Maintenance"
	icon_state = "maint_engine"

/area/dreyfus/ingenierie/maintenance
	name = "Engineering Maintenance"
	icon_state = "maint_engineering"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance

/area/dreyfus/ingenierie/acces
	name = "Engineering Access"
	icon_state = "engineering_foyer"

/area/dreyfus/ingenierie/controle
	name = "Station Control Room"
	icon_state = "engine_monitoring"

/area/dreyfus/ingenierie/equipement
	name = "Engineering - Locker Room"
	icon_state = "engineering_locker"

/area/dreyfus/ingenierie/EVA
	name = "EVA Storage"
	icon_state = "eva"

/area/dreyfus/ingenierie/quartiers
	name = "Engineering - Crew Quarters"
	icon_state = "crew_quarters"

/area/dreyfus/ingenierie/telecomm
	name = "Telecommunications"
	icon_state = "tcomsatcham"

/area/dreyfus/ingenierie/detente
	name = "Engineering - Break Room"
	icon_state = "engineering_break"

//Faux pont

/area/dreyfus/fauxpont/maintenance
	name = "Silicons Maintenance"
	icon_state = "maint_eva"
	flags = AREA_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance


/area/dreyfus/fauxpont/decheterie
	name = "Garbage Disposal"
	icon_state = "disposal"

/area/dreyfus/fauxpont/drones
	name = "Auxiliary Workshop"
	icon_state = "ai_cyborg"

/area/dreyfus/fauxpont/iasalon
	name = "AI Access"
	icon_state = "ai_foyer"

/area/dreyfus/fauxpont/iacontrole
	name = "AI Control Room"
	icon_state = "ai_upload"

/area/dreyfus/fauxpont/iachambre
	name = "AI Chamber"
	icon_state = "ai_chamber"
	forced_ambience = list('sound/ambience/ai_port_hum.ogg')

/area/dreyfus/fauxpont/vestiaires
	name = "Auxiliary Locker Room"
	icon_state = "engineering"

// Elevator areas.
/area/turbolift/coupole
	name = "Coupole"
	lift_floor_label = "Sector A"
	lift_floor_name = "Dome"
	lift_announce_str = "Arrived in Sector A, Dome: Conference room, Chapel, Garden."

/area/turbolift/bureaux
	name = "Administration"
	lift_floor_label = "Sector B"
	lift_floor_name = "Administration"
	lift_announce_str = "Arrived in Sector B, Administration: Employee Offices, Director, Brig and Evacuation."

/area/turbolift/civil
	name = "Residential Zone"
	lift_floor_label = "Sector C"
	lift_floor_name = "Residential Zone"
	lift_announce_str = "Arrived in Sector C, Residential Zone: Cafeteria, Gym, Dormitories, Medbay."

/area/turbolift/cargo
	name = "Industrial Zone"
	lift_floor_label = "Sector D"
	lift_floor_name = "Industrial Zone"
	lift_announce_str = "Arrived in Sector D, Industrial Sector: Factory, Warehouse, Refinery and Research & Development."

/area/turbolift/engi
	name = "Engineering"
	lift_floor_label = "Sector E"
	lift_floor_name = "Engineering"
	lift_announce_str = "Arrived in Sector E, Engineering: Generator, Survival Systems, Telecommunications."
	base_turf = /turf/simulated/floor

// Dircen

/area/syndicate_mothership
	name = "Mercenary Base"
	icon_state = "syndie-ship"
	requires_power = 0
	dynamic_lighting = 0

/area/syndicate_mothership/ninja
	name = "\improper Ninja Base"

//Rescue ship

area/shuttle/lavalette/start
	name = "Corvette La Valette"
	icon_state = "shuttlered"

//Merc ship

area/shuttle/merc/start
	name = "Chasseur Huon"
	icon_state = "shuttlered"

//Skipjack

/area/skipjack_station
	name = "Skipjack Stiletto"
	icon_state = "yellow"
	requires_power = 0

//Pod areas

/area/shuttle/escape_pod1/station
	name = "\improper Escape Pod One"
	flags = AREA_RAD_SHIELDED
	icon_state = "shuttle2"

//Pod landing

/area/dreyfus/exterieur
	icon_state = "mining"
	requires_power = 0
	dynamic_lighting = 0