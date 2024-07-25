; $arg1 = number you want to change into a percentage
; Returns a fixed percentage the game gives you.
function @FixPercentage($arg1:number) : number
    return $arg1 * 100

; $arg1 = current value
; $arg2 = max value
; Returns percent the current value makes up of the max value
function @CurrentPercent($arg1:number, $arg2:number) : number
    return $arg1 / $arg2

; Returns formatted value down to select decimal amount
function @Format1Dec($arg1:number):number
    return text("{0.0}", $arg1):number
function @Format2Dec($arg1:number):number
    return text("{0.00}", $arg1):number
function @Format3Dec($arg1:number):number
    return text("{0.000}", $arg1):number