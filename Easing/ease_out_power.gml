/// @func  ease_out_power(start, end, amount, power)
/// @arg   start  
/// @arg   end    
/// @arg   amount 
/// @arg   power  

var _start = argument[0];
var _end = argument[1];
var _amount = argument[2];
var _power = argument[3];

return _start + (1-power(1-_amount,_power)) * (_end - _start);
