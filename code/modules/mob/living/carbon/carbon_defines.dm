/mob/living/carbon/
	gender = MALE
	var/datum/species/species //Contains icon generation and language information, set during New().
	var/list/stomach_contents = list()
	var/list/datum/disease2/disease/virus2 = list()
	var/list/antibodies = list()
	var/datum/happiness_event/list/events = list()


	var/life_tick = 0      // The amount of life ticks that have processed on this mob.
	var/obj/item/handcuffed = null //Whether or not the mob is handcuffed
	//Surgery info
	var/datum/surgery_status/op_stage = new/datum/surgery_status
	//Active emote/pose
	var/pose = null
	var/list/chem_effects = list()
	var/datum/reagents/metabolism/bloodstr = null
	var/datum/reagents/metabolism/ingested = null
	var/datum/reagents/metabolism/touching = null
	var/losebreath = 0 //if we failed to breathe last tick

	var/coughedtime = null

	var/cpr_time = 1.0
	var/lastpuke = 0
	var/nutrition = 400

	var/obj/item/weapon/tank/internal = null//Human/Monkey


	//these two help govern taste. The first is the last time a taste message was shown to the plaer.
	//the second is the message in question.
	var/last_taste_time = 0
	var/last_taste_text = ""

	//For sad, thirsty, and dirty lads.
	var/happiness = 0
	var/thirst = THIRST_LEVEL_FILLED
	var/hygiene = HYGIENE_LEVEL_NORMAL
	var/my_hygiene_factor = HYGIENE_FACTOR
	//What your social class is. Shows up when you're examined.
	var/social_class = SOCIAL_CLASS_MED
