; Works with all fluid tanks

// Channel 0, Get the fluid amount in the tank
function @GetFluidLevel($Alias:text) : number
	return input_number($Alias, 0)