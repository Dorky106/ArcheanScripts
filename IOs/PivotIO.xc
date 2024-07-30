// Channel 0 Get/Set angle
function @GetPivotAngle($alias:text):number
	return input_number($alias, 0)

// Note: If the Pivot set to Servo mode it'll move to the angle set, otherwise it'll rotate by set speed at the set Angle amount
function @SetPivotAngle($alias:text, $v:number)
	output_number($alias, 0, $v)


// Channel 1 Get/Set Rotation Speed
function @GetPivotSpeed($alias:text):number
	return input_number($alias, 1)

function @SetPivotSpeed($alias:text, $v:number)
	output_number($alias, 1, $v)