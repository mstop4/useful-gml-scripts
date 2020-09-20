/// @func  soft_clamp(original_value, delta, min, max)
/// @desc  Change a value if and only if the new value is between min and max
/// @arg   original_value 
/// @arg   delta          
/// @arg   min            
/// @arg   max            

var _original_value = argument[0];
var _delta = argument[1];
var _min = argument[2];
var _max = argument[3];

if (_original_value + _delta >= _min && _original_value + _delta <= _max)
	return _original_value + _delta;
else
	return _original_value;