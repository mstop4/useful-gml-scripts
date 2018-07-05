/// @function soft_max(original_value, delta, max)
/// @description Change a value if and only if the new value is less than max
/// @param original_value
/// @param delta
/// @param max

var _original_value = argument[0];
var _delta = argument[1];
var _max = argument[2];

if (_original_value + _delta <= _max)
	return _original_value + _delta;
else
	return _original_value;