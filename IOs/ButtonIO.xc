; Works with Push & Toggle Buttons
function @GetButtonPushed($Alias:text)
	return input_number($Alias, 0)