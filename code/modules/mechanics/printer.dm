/obj/item/mechcomp/printer
	name = "Mechanical Computer printer"
	desc = "Sadly, it doesn't print money."

	icon_state = "comp_tprint"

	place_flags = MECH_PLACE_WALL | MECH_PLACE_ABOVE

	var/paper_title = ""
	var/paper_print = ""

/obj/item/mechcomp/printer/New()
	..()
	handler.add_input("set title", "set_title")
	handler.add_input("set print", "set_print")
	handler.add_input("print", "print")
	handler.max_outputs = 0

/obj/item/mechcomp/printer/proc/set_title(signal)
	paper_title = sanitize(signal)

/obj/item/mechcomp/printer/proc/set_print(signal)
	paper_print = sanitize(signal)

/obj/item/mechcomp/printer/proc/print(signal)
	if(!ready)
		return

	ready = 0
	spawn(30)
		ready = 1

	var/obj/item/weapon/paper/doc = new/obj/item/weapon/paper(loc)
	doc.info = paper_print
//	doc.name = paper_title
	doc.name = (paper_title == "" ? "paper" : paper_title)

	flick(icon_state + "_active", src)

/obj/item/mechcomp/printer/get_settings(var/source)
	var/dattitle = "<B>Printer settings:</B><BR>"
	dattitle += "Title : <A href='?src=\ref[source];printer_action=set_title'>[length(paper_title) == 0 ? " " : paper_title]</A><BR>"
	return dattitle
	var/datprint = "<B>Printer settings:</B><BR>"
	datprint += "Print : <A href='?src=\ref[source];printer_action=set_print'>[length(paper_print) == 0 ? " " : paper_print]</A><BR>"
	return datprint

/obj/item/mechcomp/printer/set_settings(href, href_list, user)
	if(href_list["printer_action"])
		switch(href_list["printer_action"])
			if("set_title")
				paper_title = inputText(user, "Enter a new title:", "Set title")
			if("set_print")
				paper_print = inputText(user, "Enter a new text:", "Set print")

		return MT_REFRESH