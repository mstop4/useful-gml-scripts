/// @func  soft_min(original_value, delta, min)
/// @desc  Change a value if and only if the new value is more than min
/// @arg   original_value 
/// @arg   delta          
/// @arg   min 

var _original_value = argument[0];
var _delta = argument[1];
var _min = argument[2];

if (_original_value + _delta >= _min)
	return _original_value + _delta;
else
	return _original_value;