include "OreScannerIO.xc"
include "PivotIO.xc"

function @Ore360Radar($screen:screen, $pivot:text, $scanner:text, $ore:text, $maxdistance:number)
	$screen.draw(0, 0, color(0,0,0,1), $screen.width, $screen.height) 
	
	var $halfWidth = $screen.width / 2
	var $halfHeight = $screen.height / 2
	var $maxSteps = $screen.width
	
	@SetPivotSpeed($pivot, -0.01)
	var $angle = @GetPivotAngle($pivot) * 2pi
	var $x = sin($angle)
	var $y = cos($angle)
	
	repeat $maxSteps ($s)
		var $step =  (1 + $s) / $maxSteps
		var $distance = $step * $maxdistance
		@OrePulse($scanner, $s, $distance)
		var $comp = @OreResults($scanner, $s)
		if $comp.$ore
			var $color = color(0,255*$comp.$ore, 0)
			var $xx = (1-$x * $step) * $halfWidth
			var $yy = (1-$y * $step) * $halfHeight
			$screen.draw_point($xx, $yy, $color)
							
	$screen.draw_point($halfWidth, $halfHeight, red)

var $Direction = 0
function @OreConeRadar($screen:screen, $pivot:text, $scanner:text, $ore:text, $maxdistance:number)
	$screen.draw(0, 0, color(0,0,0,0.5), $screen.width, $screen.height)
	var $halfWidth = $screen.width / 2
	var $halfHeight = $screen.height / 2
	var $maxSteps = $screen.width
	if $Direction == 0
		@SetPivotSpeed($pivot, -0.01)
	else
		@SetPivotSpeed($pivot, 0.01)
	var $angle = @GetPivotAngle($pivot) * 2pi
	if $angle <= 5.5 && $angle >= 5.49 ; Check if angel is between 45-47 to change direction
		$Direction = 1
	elseif $angle <= 0.79 && $angle >= 0.78
		$Direction = 0
	
	var $x = sin($angle)
	var $y = cos($angle)
	
	repeat $maxSteps ($s)
		var $step =  $s / $maxSteps
		var $distance = $step * $maxdistance
		@OrePulse($scanner, $s, $distance)
		var $comp = @OreResults($scanner, $s)
		if $comp.$ore
			var $color = color(0,(255*$comp.$ore), 0)
			var $xx = (1-$x * $step) * $halfWidth
			var $yy = (1-$y * $step) * $halfHeight
			$screen.draw_point($xx, $yy, $color)
							
	$screen.draw_point($halfWidth, $screen.height, red)
