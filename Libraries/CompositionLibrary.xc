function @OreTypes($arg1 : text) : text
	if $arg1 == "Ag"
		return "Silver"
	elseif $arg1 == "Al"
		return "Aluminium"
	elseif $arg1 == "Au"
		return "Gold"
	elseif $arg1 == "C"
		return "Carbon"
	elseif $arg1 == "Cr"
		return "Chrome"
	elseif $arg1 == "Cu"
		return "Copper"
	elseif $arg1 == "Fe"
		return "Iron"
	elseif $arg1 == "Ni"
		return "Nickle"
	elseif $arg1 == "Pb"
		return "Lead"
	elseif $arg1 == "Si"
		return "Silicon"
	elseif $arg1 == "Sn"
		return "Tin"
	elseif $arg1 == "Ti"
		return "Titanium"
	elseif $arg1 == "U"
		return "Uranium"
	elseif $arg1 == "W"
		return "Tungsten"
	else
		return "Fail"
