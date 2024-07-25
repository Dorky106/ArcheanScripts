;; WORKS FOR LAMPS AND SPOTLIGHTS

function @Toggle($lampAlias:text)
	output_number($lampAlias, 0, input_number($lampAlias, 0))

function @TurnOff($lampAlias:text)
	output_number($lampAlias, 0, 0)
	
function @TurnOn($lampAlias:text)
	output_number($lampAlias, 0, 1)
	
function @AdjustRed($lampAlias:text, $R:number)
	output_number($lampAlias, 1, $R)
	
function @AdjustGreen($lampAlias:text, $G:number)
	output_number($lampAlias, 2, $G)
	
function @AdjustBlue($lampAlias:text, $B:number)
	output_number($lampAlias, 3, $B)

function @AdjustColor($lampAlias:text, $R:number, $G:number, $B:number)
	@AdjustRed($lampAlias, $R)
	@AdjustGreen($lampAlias, $G)
	@AdjustBlue($lampAlias, $B)
	
function @IsTurnedOn($lampAlias:text)
	return input_number($lampAlias, 0)
	
function @GetRedHue($lampAlias:text)
	return input_number($lampAlias, 1)
	
function @GetGreenHue($lampAlias:text)
	return input_number($lampAlias, 2)
	
function @GetBlueHue($lampAlias:text)
	return input_number($lampAlias, 3)