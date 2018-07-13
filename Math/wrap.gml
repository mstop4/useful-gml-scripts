/// @func  wrap(value, min, max)
/// @arg   value 
/// @arg   min   
/// @arg   max   

var _value = argument[0];
var _min = argument[1];
var _max = argument[2];

var _range = _max - _min + 1;

while (_value < _min)
	_value += _range;

return (_value - _min) mod _range + _min;