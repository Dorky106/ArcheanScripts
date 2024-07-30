// Channel 0 Stuff (Craft Progress and Enable/Disable Crafter)
function @GetCrafterProgress($Alias:text): number
	return input_number($Alias, 0)

function @StopCraft($Alias:text)
	output_number($Alias, 0, 0)
	
function @StartCraft($Alias:text)
	output_number($Alias, 0, 1)
	
// Channel 1 Setting craft recipe
function @GetCraft($Alias:text):text
	return input_number($Alias, 1)
	
function @SetCraft($Alias:text, $Item:text)
	output_text($Alias, 1, $Item)
