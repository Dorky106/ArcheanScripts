; Gets whether or not the anchor is turned on or not
function @GetAnchored($Alias:text) : number
	return input_number($Alias, 0)

function @SetAnchor($Alias:text, $v)
	return input_number($Alias, 0, $v)