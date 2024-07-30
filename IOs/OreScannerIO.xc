// Check for ore X distance away
function @OrePulse($Alias:text, $Channel:number, $Distance:number)
	output_number($Alias, $Channel, $Distance)

// Get the results of if there is ore from an OrePulse
function @OreResults($Alias:text, $Channel:number):text
	return input_text($Alias, $Channel)