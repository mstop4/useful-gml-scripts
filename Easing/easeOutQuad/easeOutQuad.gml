/// @arg	t
/// @arg	start
/// @arg	magnitude
/// @arg	duration (max_t)

// x = t / d
// y = -m * (x^2 - 2x) + s

var _t = argument[0];
var _start = argument[1];
var _magnitude = argument[2];
var _duration = argument[3];

var _norm_t = _t / _duration;

return -_magnitude * _norm_t * (_norm_t-2) + _start;
