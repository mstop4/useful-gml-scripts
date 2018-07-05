/// @function pulse(t, min, max)
/// @param t
/// @param min
/// @param max

var _t = argument[0];
var _min = argument[1];
var _max = argument[2];

if (_t >= _min && _t <= _max)
	return 1 - ((_t - _min) / (_max - _min));

else
	return 0;