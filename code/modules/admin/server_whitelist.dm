#define CKEYWHITELIST "data/ckey_whitelist.txt"

/hook/startup/proc/loadCkeyWhitelist()
	load_ckey_whitelist()
	return 1

/proc/load_ckey_whitelist()
	log_admin("Loading ckey_whitelist")
	ckey_whitelist = list()
	var/list/Lines = file2list(CKEYWHITELIST)
	for(var/line in Lines)
		if(!length(line))
			continue

		var/ascii = text2ascii(line,1)

		if(copytext(line,1,2) == "#" || ascii == 9 || ascii == 32)//# space or tab
			continue

		ckey_whitelist.Add(line)

	if(!ckey_whitelist.len)
		log_admin("ckey_whitelist: empty or missing.")
		ckey_whitelist = null
	else
		log_admin("ckey_whitelist: [ckey_whitelist.len] entrie(s).")

/proc/check_ckey_whitelisted(var/ckey)
	return (ckey_whitelist && (ckey in ckey_whitelist) )

/datum/admins/proc/ToggleCkeyWhitelist()
	set category = "Server"
	set name = "Toggle ckey Whitelist"
	set desc="Toggles the ckey Whitelist on and off."

	config.useckeywhitelist = !config.useckeywhitelist
	if(config.useckeywhitelist)
		load_ckey_whitelist()
		to_world("<B>The pool is now closed.</B>")
		log_admin("[key_name(usr)] enabled the ckey whitelist.")
	else
		ckey_whitelist = null
		to_world("<B>The pool is now open.</B>")
		log_admin("[key_name(usr)] disabled the ckey whitelist.")

/datum/admins/proc/ReloadCkeyWhitelist()
	set category = "Server"
	set name = "Reload ckey Whitelist"
	set desc="Reloads the ckey Whitelist."

	load_ckey_whitelist()
	log_and_message_admins("[key_name(usr)] has reloaded the ckey whitelist.")

#undef CKEYWHITELIST
