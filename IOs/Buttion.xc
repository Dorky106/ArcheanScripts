; Works with Push & Toggle Buttons

function @GetButtonPushed($Alias:text) : number
	return input_number($Alias, 0)