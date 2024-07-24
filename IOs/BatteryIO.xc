function @GetVoltage($Alias:text):number
	return input_number($Alias, 0)
	
function @GetCapacity($Alias:text):number
	return input_number($Alias, 1)
	
function @GetCharge($Alias:text):number
	return input_number($Alias, 2)
	
function @GetThroughput($Alias:text):number
	return input_number($Alias, 3)
