/// @func  soft_max(original_value, delta, max)
/// @desc  Change a value if and only if the new value is less than max
/// @arg   original_value 
/// @arg   delta          
/// @arg   max            

var _original_value = argument[0];
var _delta = argument[1];
var _max = argument[2];
if (_original_value + _delta <= _max)
	return _original_value + _delta;
else
	return _original_value;