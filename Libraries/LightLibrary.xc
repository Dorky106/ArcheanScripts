include "LampIO.xc"

function @Toggle($lightAlias:text)
	$SetLight($lightAlias, !@IsTurnedOn($lightAlias))
	
function @AdjustColor($lampAlias:text, $R:number, $G:number, $B:number)
	@AdjustRed($lampAlias, $R)
	@AdjustGreen($lampAlias, $G)
	@AdjustBlue($lampAlias, $B)