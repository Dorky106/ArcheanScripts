// Channel 0 Enable/Disable Drill
function @DrillStop($Alias:text)
	output_number($Alias, 0, 0)
	
function @DrillStart($Alias:text)
	output_number($Alias, 0, 1)

// Channel 1, Get Ore Composition of rock
function @GetComposition($Alias:text):text
	return input_text($Alias, 0)
	
// Channel 2, Get Depth the ore patch has been drilled
function @GetDepth($Alias:text):number
	return input_number($Alias, 1)
	
// Channel 3, Get Efficiency of the drill
function @GetEfficiency($Alias:text):number
	return input_number($Alias, 2)

// Channel 4, Get Rock/Sec mined
function @GetMiningRate($Alias:text):number
	return input_number($Alias, 3)
	
// Channel 5, Get Depth/sec
function @GetDrillingRate($Alias:text):number
	return input_number($Alias, 4)
