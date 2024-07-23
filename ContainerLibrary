include "ContainerIO.xc"

function @EmptySlots($Alias:text):number
	var $ret = 50
	var $tmp = @GetContents($Alias)
	foreach $tmp($k, $v)
		$ret--
	return $ret
	
function @FilledSlots($Alias:text):number
	var $ret = 0
	var $tmp = @GetContents($Alias)
	foreach $tmp($k, $v)
		$ret++
	return $ret
	
function @HaveItem($Alias:text, $Item:text):number
	var $tmp = @GetContents($Alias)
	foreach $tmp($k, $v)
		if ($Item == $k)
			return 1
	return 0
	
function @GetItemAmount($Alias:text, $Item:text):number
	var $tmp = @GetContents($Alias)
	foreach $tmp($k, $v)
		if ($Item == $k)
			return $v
	return 0

function @GetAmountMissing($Alias:text, $Item:text, $WantedAmount:number):number
	var $tmp = @GetContents($Alias)
	foreach $tmp($k, $v)
		if($Item == $k)
			var $ret = $WantedAmount - $v
			if $ret <= 0
				$ret = 0
			return $ret
	return $WantedAmount
