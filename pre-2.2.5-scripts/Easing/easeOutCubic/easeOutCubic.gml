/// @arg	t
/// @arg	start
/// @arg	magnitude
/// @arg	duration (max_t)

// x = t / d
// y = m * ((x-1)^3 + 1) + s

var _t = argument[0];
var _start = argument[1];
var _magnitude = argument[2];
var _duration = argument[3];

var _norm_t = (_t / _duration) - 1;

return _magnitude * (_norm_t * _norm_t * _norm_t + 1) + _start;
