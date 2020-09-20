/// @func  pulse(t, min, max)
/// @arg   t   
/// @arg   min 
/// @arg   max 

var _t = argument[0];
var _min = argument[1];
var _max = argument[2];

if (_t >= _min && _t <= _max)
	return 1 - ((_t - _min) / (_max - _min));

else
	return 0;