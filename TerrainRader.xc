; NOTE THIS IS A WIP function!

function @TerrainRadar($screen:screen, $pivot:text, $scanner:text, $maxdistance:number)
	if tick % 10 == 1
		$screen.draw(0, 0, color(0,0,0,1), $screen.width, $screen.height) 
	
	var $halfWidth = $screen.width / 2
	var $halfHeight = $screen.height / 2
	var $maxSteps = $screen.width
	
	output_number($pivot, 0, -0.01)
	var $angle = input_number($pivot, 0) * 2pi
	var $x = sin($angle)
	var $y = cos($angle)
	
	repeat $maxSteps ($s)
		var $color = color(0,0,0)
		var $step =  (1 + $s) / $maxSteps
		var $distance = $step * $maxdistance
		output_number($scanner, $s, $distance)
		var $comp = input_number($scanner, $s)
		if $comp  < 0
			$color = color(0, 0, 5+abs($comp))
		else
			$color = color(5+$comp, 5+$comp, 5+$comp)
		var $xx = (1-$x * $step) * $halfWidth
		var $yy = (1-$y * $step) * $halfHeight
		$screen.draw_point($xx, $yy, $color)
							
	$screen.draw_point($halfWidth, $halfHeight, color(255,0,0))
