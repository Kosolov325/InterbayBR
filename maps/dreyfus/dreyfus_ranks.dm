/datum/map/dreyfus
	branch_types = list(
		/datum/mil_branch/ouvrier,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/administration
	)

	spawn_branch_types = list(
		/datum/mil_branch/ouvrier,
		/datum/mil_branch/contractuel,
		/datum/mil_branch/administration
	)

/datum/mil_branch/ouvrier
	name = "Workers"
	name_short = "OUV"
	email_domain = "extraposte.free.nt"

	assistant_job = "Assistant"

/datum/mil_branch/contractuel
	name = "Hired worker"
	name_short = "CTRAT"
	email_domain = "gocourriel.uni.nt"

	assistant_job = "Trainee"

/datum/mil_branch/administration
	name = "Administration"
	name_short = "ADMIN"
	email_domain = "intranet.nano"

	assistant_job = "Secretary"