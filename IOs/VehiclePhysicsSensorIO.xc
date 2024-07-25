function @ActivePhysics($Alias:text):number
	return input_number($Alias, 0)
	
function @GetMass($Alias:text):number
	return input_number($Alias, 1)

function @GetSizeX($Alias:text):number
	return input_number($Alias, 2)
	
function @GetSizeY($Alias:text):number
	return input_number($Alias, 3)
	
function @GetSizeZ($Alias:text):number
	return input_number($Alias, 4)
	
function @GetMassCenterX($Alias:text):number
	return input_number($Alias, 5)
	
function @GetMassCenterY($Alias:text):number
	return input_number($Alias, 6)
	
function @GetMassCenterZ($Alias:text):number
	return input_number($Alias, 7)
	
function @GetGForce($Alias:text):number
	return input_number($Alias, 8)