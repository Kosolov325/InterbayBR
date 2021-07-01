/datum/book_chapter
	var/title = ""
	var/content = ""
	var/list/words = null

/datum/book_chapter/New()
	content = replacetext(content,"\t","") //this is just convenience.
	content = replacetext(content,"\n"," ")//so writing the content isn't too painful.

	words = splittext(content," ")

	content = ""//does this free some memory?

/obj/item/weapon/book/rpbook
	name = "Interbay Lorebook System"
	desc = "Books that you can read!"

	icon = 'icons/obj/library.dmi'
	icon_state = "spellbook"

	unique = 1	//kinda needed to prevent people writing into it

	var read_time = 5			//Length of each reading sessions, in seconds.
	var word_per_minute = 250	//Base reading speed at int = 10

	var/datum/book_chapter/current_chapter = null
	var/list/chapters = list()
	var/first_word = 0


/obj/item/weapon/book/rpbook/attack_self(var/mob/user as mob)
	if(carved)
		if(store)
			to_chat(user, "<span class='notice'>[store] falls out of [title]!</span>")
			store.loc = get_turf(src.loc)
			store = null
			return
		else
			to_chat(user, "<span class='notice'>The pages of [title] have been cut out!</span>")
			return

	if(!chapters || !chapters.len)
		to_chat(user, "This book is completely blank!")
		return

	select_chapter(user)

	if(!current_chapter)
		return

	if(!first_word)
		read(user)
		return

	var option_read = "Continue reading from here."
	var option_restart = "Return to chapter start."
	var option_chapter = "Pick a different chapter."

	var/chapter_name = ""
	var/list/options = list(option_read,option_restart)

	if(chapters.len > 1) //Chapters only matter for books that have more than one.
		options.Add(option_chapter)
		chapter_name = current_chapter.title

	var/choice = input("[name] - [chapter_name]", name) as null|anything in options //"Someone left a page mark in this book."
	if(!choice)
		return

	if(choice == option_read || choice == option_restart)
		if(choice == option_restart)
			first_word = 0
	else if(choice == option_chapter && chapters.len > 1)
		current_chapter = null
		first_word = 0
		select_chapter(user)
	read(user)

/obj/item/weapon/book/rpbook/proc/select_chapter(var/mob/user as mob)
	if(current_chapter)
		return

	/var/chapter_type = null

	if(chapters.len == 1)	//only one chapter? load the first one available.
		chapter_type = chapters[1]
	else
		var/list/chapter_names = list()
		for(var/entry in chapters)
			var/datum/book_chapter/C = new entry()
			chapter_names.Add(C.title)

		var/choice = input("Which chapter would you like to read?", name) as null|anything in chapter_names
		if(!choice)
			return

		var/found = chapter_names.Find(choice)

		if(found)
			chapter_type = chapters[found]

	if(ispath(chapter_type))
		current_chapter = new chapter_type()

/obj/item/weapon/book/rpbook/proc/read(var/mob/user as mob)
	if(!current_chapter)
		return

	user.visible_message("[user] opens a book titled \"[src.name]\" and begins reading intently.")
	while(current_chapter && do_after(user, read_time SECONDS, progress=1)) //This should allow us to read the entire chapter in a row unless we are interrupted.
		read_segment(user)


/obj/item/weapon/book/rpbook/proc/read_segment(var/mob/user as mob)
	if(!current_chapter)
		return

	first_word+=1	//move to the next word, OR the first word if we started a new chapter.

	var/list/words = current_chapter.words
	var/allowed_words = round(((word_per_minute / 600) * user.int) * read_time) //-> INT1=2words INT10=20words INT20=41 at 250word/minute

	var/end_word = min(first_word + allowed_words,words.len)
	while(end_word != words.len) //skip ahead to the next punctuation mark so the sentence doesn't end mid-way.
		var/W = words[end_word]
		var/L = copytext(W,length(W))

		var/list/connectors = list("and","or","to", "also", "then", "so", "but", "either", "yet")
		var/punctuation = ":.,;!?"

		if(findtext(punctuation,L) || connectors.Find(W) ) //move forward until we hit a punctuation mark or a connector word.
			break
		end_word++

	var/msg = words.Join(" ",first_word, end_word+ (first_word == 1) ) //Why is list.Join() being weird?

	if(user.int == 1) //illiterate :P
		msg = uh(msg)

	to_chat(user, "<i>\"[msg]\"</i>" )

	if(end_word == words.len)
		current_chapter = null
		first_word = 0
		to_chat(user, "<i>--You have reached the end of this chapter--</i>")
	else
		first_word = end_word

/obj/item/weapon/book/rpbook/proc/uh(var/S)
	var/regex/upper = new("\[A-Z\]", "g")
	var/regex/lower = new("\[a-z\]", "g")
	S = upper.Replace(S,"U")	 //All uppercases become "U"
	S = lower.Replace(S, "h")	 //replaces all lowercase letters with "h"
	S = replacetext(S," h"," u") //makes it so we words start with "u" most of the time.
	return S


//THIS IS PROBABLY TERRIBLE (you can force someone to read, essentially)
/obj/item/weapon/book/rpbook/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(user.zone_sel.selecting == BP_EYES && current_chapter)
		user.visible_message("<span class='notice'>You open up the book and show it to [M]. </span>", "<span class='notice'> [user] opens up a book and shows it to [M]. </span>")
		read(M)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //to prevent spam
