/obj/item/weapon/book/rpbook/engine
	name = "Thermoelectric Generator Servicing"
	desc = "A hefty instruction manual directed at engineers."
	icon_state = "bookEngineering"
	chapters = list(/datum/book_chapter/engine_basic, /datum/book_chapter/engine_setup, /datum/book_chapter/engine_chamber, /datum/book_chapter/engine_trouble)

/datum/book_chapter/engine_basic
	title = "General concepts"
	content = {"Thermoelectric generators are a specific type of power generation. They convert thermal energy into electrical energy through a variety of chemical or mechanical processes. They
	usually have an output socket for the produced electricity, a hot end and a cold end.  The difference in temperature between the hot end and the
	cold end is what is called a temperature delta. The temperature delta determinates the amount of energy that can be extracted from the system. Each side should be filled with a suitable,
	thermal conduction gas. The cold end gas should be run through a cooling heatsink exposed to a medium that will allow the excess heat to be radiated away from the system. The hot end should
	be run through an exchange system which allows it to harvest calories from a thermal energy source. Typical designs use a combustion chamber where fuel is burned, highly radioactive pellets
	that radiate heat naturally as they decay, nuclear reactors where a chain reaction is used to produce heat of some sort or any other reliable source of thermal energy."}

/datum/book_chapter/engine_setup
	title = "Installation and start-up"
	content = {"A few steps are required to setup a thermoelectric generator: First, the engine itself must be firmly bolted to the floor of the engine room, this will ensure proper electrical
	connectivity and secure the circulator elements on their respective gas loops; some designs are reversible but one should be mindful of polarity when connecting these engines to a	pipe network,
	as the impellers built into each end of a Thermoelectric generator are designed to allow flow in only one direction. Second, fill the hot and cold loop with a thermal conduction gas of your
	choice and adjust the different pumps around each side of the engine to ensure that the gas circulates without problems in each loop. Because gasses contract when cool and expand when hot, you can
	add more gas on the cold loop to increase its efficiency as the pressure on that side will be lower. Third, ensure that your primary power storage SMES (or any other system available) are	online
	and ready for charging. Fourth, prepare the main fuel pipe with a mixture of fuel and oxygen, one canister of oxygen should be enough for a few engine cycles, adjust the pressure of the fuel
	supply pump to adjust the richness of the mix. Fourth, check that the engine exhaust vent is in the closed position. Fifth, Engage the fuel pump to the engine combustion chamber, A fairly low
	pressure is preferable. When everything is ready, hit the ignition switch and monitor temperature and power output."}

/datum/book_chapter/engine_chamber
	title = "Combustion chamber flushing"
	content = {"As fuel and oxygen burn in the combustion chamber, CO2 will be released as the combustion byproduct. This gas will be able to store the heat of the combustion for a long time, and
	as a result, the chamber does not need to be continuously burning. As long as the heat is trapped in the gas inside it, it can be progressively harvested by the generator. However, at some
	point, the concentration of CO2 will prevent combustion, once the power output drops too low, it is adviseable to flush the combustion chamber. To do so, simply shut off the fuel injector pump
	and open the exhaust vent of the combustion chamber until all the gas inside it has vented into space. Then close the exhaust vent and begin a new combustion cycle as outlined in the start-up
	sequence."}

/datum/book_chapter/engine_trouble
	title = "Troubleshooting"
	content = {"If pumps aren't running: The power in the engine room might be out, pumps use a lot of power and the local APC might have disabled equipments to conserve energy. If engine
	interface doesn't show: The engine hasn't been bolted to the floor. If the engine is running but the circulators aren't spinning: Check the pressure in the hot and cold loop, check pipe
	connections, check that pumps are running, increase pump pressure. The engine was running but everything suddently stopped: Check that the engine room APC is actually being charged, it will
	run out very quickly otherwise. If fuel isn't getting into the combustion chamber: Check all pumps on the fuel line, check pressure in the master fuel tank, check that the APC is powering the
	 'environement' circuit (or the fueld vents will not work)."}
