function @GetGeneratedPower($Alias:text) : number
	return input_number($Alias, 0)
	
function @GetOutputPower($Alias:text) : number
	return input_number($Alias, 1)