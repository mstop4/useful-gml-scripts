/// @function soft_clamp(original_value, delta, min, max)
/// @description Change a value if and only if the new value is between min and max
/// @param original_value
/// @param delta
/// @param min
/// @param max

var _original_value = argument[0];
var _delta = argument[1];
var _min = argument[2];
var _max = argument[3];

if (_original_value + _delta >= _min && _original_value + _delta <= _max)
	return _original_value + _delta;
else
	return _original_value;