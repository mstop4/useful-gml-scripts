/// @function soft_min(original_value, delta, min)
/// @description Change a value if and only if the new value is mmore than min
/// @param original_value
/// @param delta
/// @param max

var _original_value = argument[0];
var _delta = argument[1];
var _min = argument[2];

if (_original_value + _delta >= _min)
	return _original_value + _delta;
else
	return _original_value;