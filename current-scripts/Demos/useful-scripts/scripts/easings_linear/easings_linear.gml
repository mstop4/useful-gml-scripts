/// @func            easing_linear(_start, _end, _t)
/// @desc            linear interpolation (same as lerp())
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_linear(_start, _end, _t) {
	// (e + s) * _t + s
	return lerp(_start, _end, _t);
}