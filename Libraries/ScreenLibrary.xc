var $Screen = screen
; Button Vars
var $btnBorder = color(255,255,255)
var $selected = color(  0,255,  0)
var $unselected = color(255,  0,  0)
var $textColor = color  (0,  0,255)

; Gets horizontal center	
function @centerX():number
	return $Screen.width/2
; Get vertical center
function @centerY():number
	return $Screen.height/2

; Gets the pixel length of a string
function @getTextWidth($text:text):number
	return size($text)*$Screen.char_w
	
; Gets the middle section of a string
function @getTextHalfWidth($text:text):number
	return @getTextWidth($text)/2

; $value = Current Value
; $maxValue = MaxValue of the progressbar
; $startX = Starting X position for the progressbar
; $startY = Starting Y position for the progressbar
; $endX = Ending X position for the progressbar
; $endY = Ending Y position for the progressbar
; $title = Text you want to show up in the center of the progress bar
function @TitledProgressbar($value:number, $maxValue:number, $startX:number, $startY:number, $endX:number, $endY:number, $title:text)
	var $percentage = $value / $maxValue
	if $percentage > 1
		$percentage = 1
	$Screen.draw_rect($startX,$startY,$endX,$endY,white,red)
	if  $value != 0
		$Screen.draw_rect($startX+1,$startY+1,$startX+($endX-1-$startX)*$percentage,$endY-1,green,green)
	$Screen.write(($endX - $startX)/2 - @getTextHalfWidth($title) + $startX, $startY+1, $textColor, $title)

; $value = Current Value
; $maxValue = MaxValue of the progressbar
; $startX = Starting X position for the progressbar
; $startY = Starting Y position for the progressbar
; $endX = Ending X position for the progressbar
; $endY = Ending Y position for the progressbar
function @Progressbar($value:number, $maxValue:number, $startX:number, $startY:number, $endX:number, $endY:number)
	var $percentage = $value / $maxValue
	if $percentage > 1
		$percentage = 1
	$Screen.draw_rect($startX,$startY,$endX,$endY,white,red)
	if  $value != 0
		$Screen.draw_rect($startX+1,$startY+1,$startX+($endX-1-$startX)*$percentage,$endY-1,green,green)

; $startX = Starting X position for the button
; $startY = Starting Y position for the button
; $endX = Ending X position for the button
; $endY = Ending Y position for the button
; $btnText = Text you want to show up on the button
; $btnValue = Value to return if the button is clicked
; $crtValue = Current value of last button clicked
; Returns $btnValue which is provided if the button is clicked, otherwise returned the crtValue
function @Button($startX:number, $startY:number, $endX:number, $endY:number, $btnText:text, $btnValue:number, $crtValue:number) : number
	if $crtValue == $btnValue
		if $Screen.button_rect($startX, $startY, $endX, $endY, $btnBorder, $selected)
			return $btnValue
	else
		if $Screen.button_rect($startX, $startY, $endX, $endY, $btnBorder, $unselected)
			return $btnValue
	$Screen.write(($endX - $startX)/2 - @getTextHalfWidth($btnText) + $startX, $startY+1, $textColor, $btnText)
	return $crtValue

function @ToggleButton($startX:number, $startY:number, $endX:number, $endY:number, $btnText:text, $enabled:number):number
	if $enabled == 0 ; Disabled
		if($Screen.button_rect($startX, $startY, $endX, $endY,$btnBorder, $selected)
			return 1
	else ; Enabled
		if $screen.button_rect($startX, $startY, $endX, $endY, $btnBorder, $unselected)
			return 0
	$Screen.write(($endX - $startX)/2 - @getTextHalfWidth($btnText) + $startX, $startY+1, $textColor, $btnText)
	return $enabled

; $startX = Starting X position for the button
; $startY = Starting Y position for the button
; $endX = Ending X position for the button
; $endY = Ending Y position for the button
; $btnValue = Value to return if the button is clicked
; $crtValue = Current value of last button clicked
; Returns $btnValue which is provided if the button is clicked, otherwise returned the crtValue
function @VisibleButton($startX:number, $startY:number, $endX:number, $endY:number, $btnValue:number, $crtValue:number) : number
	if $Screen.button_rect($startX, $startY, $endX, $endY, color(0,0,0,0)
		return $btnValue
	return $crtValue
