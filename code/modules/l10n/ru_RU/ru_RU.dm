/*
	Default russian localisation
	����������� ������� �����������
*/
/datum/lang/ru_RU
	name = "default russian"

	area/name = null
	mob/name = null
	obj/name = null
	turf/name = "���"
	datum/name = null

	examine(args = null)
		switch(args)
			if("name")
				return "[GetVar()]"
			if("That's")
				return "���"
			if("stained")
				if(refObj:blood_color != "#030303")
					return "<span class='danger'>�����������[GenderForm(gender,"��","�&#255;","��","��")] [GetVar()]</span>"
				else
					return "<span class='danger'>��������[GenderForm(gender,"��","�&#255;","��","��")] ������ [GetVar()]</span>"