function @GetRotationSpeed($Alias:text, $speed:number):number
	return input_number($Alias, 0)
function @GetGroundFriction($Alias:text, $speed:number):number
	return input_number($Alias, 1)
	
function @Aceelerate($Alias:text, $speed:number)
	output_number($Alias, 0, $speed)
function @Steer($Alias:text, $dir:number)
	output_number($Alias, 1, $dir)
function @Regen($Alias:text, $regen:number)
	output_number($Alias, 2, $regen)
function @Brake($Alias:text, $break:number)
	output_number($Alias, 3, $break)
function @Gearbox($Alias:text, $gear:number)
	output_number($Alias, 4, $gear)
