/obj/item/weapon/book/rpbook/crafting_basic
	name = "Machining Basics"
	desc = "Basic Machining and Crafting.  Written by Perrin Abara"
	icon_state = "chefbook"
	chapters = list(/datum/book_chapter/crafting_basics,\
					/datum/book_chapter/crafting_tools,\
					/datum/book_chapter/crafting_items)

/datum/book_chapter/crafting_basics
	title = "Your machines and what they do.."
	content = {"You have three machines the Lathe, Press and Mill.  Almost all machining starts at the lathe, which shaves the metal into basic shapes.  The mill drills holes in metal,
	and is useful for creating pipes. It is also essential to guncrafting. The Press bends or molds the metal into specific shapes, such as the heads of tools.  Use all three to make the basic ingredients of anything on the station.
	If something can't be milled or pressed, it will hopefully fall out on it's own."}

/datum/book_chapter/crafting_tools
	title = "Making the basic tools."
	content = {"Any machinist should know how to create the most basic of tools.  A crowbar can be made by pressing a simple metal bar. Likewise, pressing a metal shiv creates a screwdriver head.  Combine it with a glass handle
	for you're very own screwdriver!  Create a wrench head by pressing a metal cylinder. Weld it onto a metal bar to complete it.  Wirecutters can be made by screwing two blades together.  Once you get the hang of these basics, try experimenting with different items."}

/datum/book_chapter/crafting_items
	title = "All about crafting"
	content = {"Crafting is required for making most things on the station.  To craft something, place the items in front of you.  Next grab the tool you need to put it all together. Lastly think very hard about what you can make.  If you
	can craft something, I'm sure it will be obvious to you.  Remeber that most things require you to have a specific tool.  Most structures on the station can be crafted out by welding together some metal bars and sheets."}