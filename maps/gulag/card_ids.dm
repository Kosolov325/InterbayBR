/obj/item/weapon/card/id/gulag
	name = "identification card"
	desc = "An identification card issued to every living unit at this prison."
	icon_state = "id"
	item_state = "card-id"
	job_access_type = /datum/job/assistant

/obj/item/weapon/card/id/gulag/crew/security
	job_access_type = /datum/job/gulag_gaurd

/obj/item/weapon/card/id/gulag/crew/security/warden
	job_access_type = /datum/job/gulag_warden