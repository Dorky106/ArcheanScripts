;; WORKS FOR LAMPS AND SPOTLIGHTS

// Channel 0 On/Off
function @SetLight($lampAlias:text, $v:number)
	output_number($lampAlias, 0, $v)

function @IsTurnedOn($lampAlias:text):number
	return input_number($lampAlias, 0)
	
// Channel 1 Red Hue
function @AdjustRed($lampAlias:text, $R:number)
	output_number($lampAlias, 1, $R)

function @GetRedHue($lampAlias:text):number
	return input_number($lampAlias, 1)
	
// Channel 2 Green Hue
function @AdjustGreen($lampAlias:text, $G:number)
	output_number($lampAlias, 2, $G)

function @GetGreenHue($lampAlias:text):number
	return input_number($lampAlias, 2)
	
// Channel 3 Blue Hue
function @AdjustBlue($lampAlias:text, $B:number)
	output_number($lampAlias, 3, $B)
	
function @GetBlueHue($lampAlias:text):number
	return input_number($lampAlias, 3)