/// @param value
/// @param min
/// @param max

var _v = argument[0];
var _min = argument[1];
var _max = argument[2];

var _range = _max - _min + 1;

while (_v < _min)
	_v += _range;

return (_v - _min) mod _range + _min;