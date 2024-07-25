function @OrePulse($Alias:text, $Channel:number, $Distance:number)
	output_number($Alias, $Channel, $Distance)
	
function @OreResults($Alias:text, $Channel:number):text
	return input_text($Alias, $Channel)