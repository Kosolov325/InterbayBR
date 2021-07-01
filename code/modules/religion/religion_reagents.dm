//REAGENTS
//The revelator toxin
/datum/reagent/toxin/revelator
	name = "Revelator"
	id = "revelator"
	description = "For proving heretics."
	strength = 25//Yep, it's poisonous. To discourage random checking.

/obj/item/weapon/reagent_containers/syringe/revelator
	name = "Syringe (revelator)"
	desc = "Contains drugs for checking heretics."
	New()
		..()
		reagents.add_reagent("revelator",15)

/datum/reagent/toxin/unrevelator
	name = "Unrevelator"
	id = "unrevelator"
	description = "For tricking church members."
	strength = 25//Yep, it's poisonous. To discourage taking it all the time.

/obj/item/weapon/reagent_containers/syringe/unrevelator
	name = "weird old syringe"
	desc = "You're not sure what it has."
	New()
		..()
		reagents.add_reagent("unrevelator",15)