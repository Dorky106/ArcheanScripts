function @DrillStop($Alias:text)
	output_number($Alias, 0, 0)
	
function @DrillStart($Alias:text)
	output_number($Alias, 0, 1)

function @GetComposition($Alias:text):text
	return input_text($Alias, 0)
	
function @GetDepth($Alias:text):number
	return input_number($Alias, 1)
	
function @GetEfficiency($Alias:text):number
	return input_number($Alias, 2)
	
function @GetMiningRate($Alias:text):number
	return input_number($Alias, 3)
	
function @GetDrillingRate($Alias:text):number
	return input_number($Alias, 4)
