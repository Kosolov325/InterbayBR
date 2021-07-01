/obj/structure/bookcase/manuals/interbay1
	desc = "It is labeled: A-Z"

/obj/structure/bookcase/manuals/interbay1/New()
	..()
	new /obj/item/weapon/book/rpbook/cooking_fancy(src) //Chef Francois's Cookbook
	new /obj/item/weapon/book/rpbook/surgery(src)		//Standard surgical procedures
	new /obj/item/weapon/book/rpbook/cooking_basic(src) //The Fry Cook Compendium
	new /obj/item/weapon/book/rpbook/anatomy(src)		//The Human Anatomy
	new /obj/item/weapon/book/rpbook/engine(src)		//Thermoelectric Generator Servicing
	new /obj/item/weapon/book/rpbook/kids_eval(src)		//What About The Children?
	update_icon()