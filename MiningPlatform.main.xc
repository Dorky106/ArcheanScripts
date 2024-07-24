include "BatteryIO.xc"
include "DrillIO.xc"

var $DrillAlias = "Drill"
var $BatteryAlias = "Battery"
var $LowBattery = 0
update
	if @GetDepth($DrillAlias) >= 6000
		@DrillStop($DrillAlias)
	
	if @GetCharge($BatteryAlias) <= 0.05
		$LowBattery = 1
	elseif @GetCharge($BatteryAlias) >= 0.95
		$LowBattery = 0

	if $LowBattery == 0
		@DrillStart($DrillAlias)
	else
		@DrillStop($DrillAlias)
