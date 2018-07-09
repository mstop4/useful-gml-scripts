/// @func  ease_in_power(start, end, amount, power)
/// @arg   start  
/// @arg   end    
/// @arg   amount 
/// @arg   power  

var _start = argument[0];
var _end = argument[1];
var _amount = argument[2];
var _power = argument[3];

return _start + (power(_amount,_power)) * (_end - _start);
