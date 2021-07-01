/obj/item/weapon/book/rpbook/surgery
	name = "Standard surgical procedures"
	desc = "Seems like it used to be a must-have for any would-be surgeon."
	icon_state = "bookHacking"
	chapters = list(/datum/book_chapter/surgery_anesthesia, /datum/book_chapter/surgery_infections, /datum/book_chapter/surgery_incision, /datum/book_chapter/surgery_fracture)

/datum/book_chapter/surgery_anesthesia
	title = "Proper use of anesthetics"
	content = {"Operating on people who are awake and in pain can be quite difficult, to ease their suffering and increase your chances of success, some form of anesthetic is strongly recommended.
	Nitrous oxide, also called laughing gas or N2O for short is a fairly safe and potent anesthetic, simply have your patient breathe from it for a few seconds until they fall asleep. Some operating
	theaters might be fitted with an automatic N2O pump by the operating table which makes this considerably simpler. If inhalation of anesthetic isn't possible due to damaged lungs, another option
	is to use an injection of soporific, it takes a little longer to affect the patient and will not work if they are suffering from cardiac arrest. Lastly if their heart and lungs are damaged, you
	can use painkillers as a last resort, but shouldn't waste too much time with anesthetics: If it is that bad you aren't in a position to waste any time. You can use a dylovene injectionto speed
	up the recovery of your patient or to counteract an over-dosage of anesthetic."}

/datum/book_chapter/surgery_infections
	title = "Infections"
	content = {"Infections can ruin an otherwise perfect surgical operation and can kill your patient easily if untreated. Always wash your hands and wear sterile gloves if possible before begining
	surgery, wear a surgical mask, ensure that the operating room is as clean as it possibly can be and use dinsinfectant if you have the slightest doubt. If an infection goes unchecked and gets to
	a peticularly advanced state, an injection of spaceacillin will help your patient's body to fight against it."}

/datum/book_chapter/surgery_incision
	title = "Incisions and sutures"
	content = {"An incision is the first step in most surgical procedures and has to be performed properly to ensure that the rest of the operation goes as planned. Once your patient is laid on the
	operation table, target the area which you want to operate on and make an incision with a sharp and clean scalpel. If a large wound exists on the operated limb, an incision might not be
	necessary. Next, use hemostats to stop any bleeding and ensure that your patient doesn't suffer haemorrhage. Use then a pair of restractors to spread the incision open and gain access to the
	insides of your patient. Opening a skull or a ribcage is a slightly more involved process, you will have to cut the skull/ribcage with a circular saw after you performed the initial incision
	before you can access inside. Suturing an incision is a fairly straightforward operation and will complete most surgical operations. Use a cautery to seal the incision, and optionally apply some gauze and ointment
	if available to prevent infection and promote healing."}

/datum/book_chapter/surgery_fracture
	title = "Fractures"
	content = {"Treating fractures is very common in space and industrial settings, artificial gravity and heavy machineries make it easy to break a leg or an arm in the workplace. To treat a
	fracture, you first have to incise the limb and then apply bone gel to the broken bone, this will act as a temporary glue until the bone fully heals. Next, snap the bone back in place with a
	bone setter and apply more bone gel while the bone sets. Once this tis done you can close the incision and your patient should be running again in no time. The bone healing procedure is also
	required after head and chest surgery to close the skull and ribcage again."}

/obj/item/weapon/book/rpbook/anatomy
	name = "The Human Anatomy"
	desc = "Dr. Falkenstein rare unillustrated edition!"
	icon_state = "bookHacking"
	chapters = list(/datum/book_chapter/anatomy_brain, /datum/book_chapter/anatomy_heart, /datum/book_chapter/anatomy_lungs)

/datum/book_chapter/anatomy_brain
	title = "The importance of the brain"
	content = {"The brain is by far the most important organ in the human body, as long as your patient still shows some sort of brain activity, there is still a chance to save him. All the
	other organs are merely there to ensure that the brain is kept in good health. The brain doesn't need very much, a steady supply of oxygen and clean blood, free from harmful chemicals and
	pathogens. Physical thrauma can obviously cause harm to the brain and so will prolonged exposure to the vacuum of space."}

/datum/book_chapter/anatomy_heart
	title = "The heart"
	content = {"The human heart behaves as a biological pump, circulating blood around the body, allowing organs to be supplied with oxygen and nutrients that they need to survive. It is one of
	the most important organs and as such, it is nested deep inside the ribcage. The heart will usually maintain the pressure of the vascular system between 90kPa and 120kPa and will beat around
	60BPM. Some chemical compounds can raise the heart rate, which can compensate for a low blood pressure, however it will lead to a faster bleedout. In all cases, a pulse exceeding 150BPM can
	lead to cardiac failure and should generally be avoided. Caffeinated products and tobacco usage typically lead to an increased heartrate. The heart can also stop beating on its own if the
	patient goes into shock from enduring too much pain, going into shock or due to a lack of blood."}

/datum/book_chapter/anatomy_lungs
	title = "The lungs"
	content = {"Lungs are reponsible for supplying oxygen to the bloodstream and are almost as important as the heart itself. They are quite sensible to high and low pressure environments and
	can easily rupture if exposed to high and low pressure. A ruptured lung will cause your patient to suffocate and slowly take brain damage, it is possible to mitigate the problem temporarly
	by using a mask and oxygen bottle at a slightly higher pressure than normal. While using air delivery systems in space, it is strongly recommended to check that the delivery pressure is at
	least 16kPa for pure oxygen or at least 76kPa for 20% airmix systems."}