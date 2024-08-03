; Works with Push & Toggle Buttons
function @GetButtonPushed($Alias:text)
	return input_number($Alias, 0)

function @SetButtonPushed($Alias:text, $v:number)
	return input_number($Alias, $v)
