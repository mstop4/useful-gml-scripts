/// @func            easing_cubic_in(_start, _end, _t)
/// @desc            cubic interpolation in
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_cubic_in(_start, _end, _t) {
	// (e + s) * t^3 + s
	var _t2 = clamp(power(_t, 3), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func            easing_cubic_out(_start, _end, _t)
/// @desc            cubic interpolation in
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_cubic_out(_start, _end, _t) {
	// (e + s) * 1 - (1-t)^3 + s
	var _t2 = clamp(1 - power(1-_t, 3), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func            easing_cubic_inout(_start, _end, _t)
/// @desc            cubic interpolation in/out
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_cubic_inout(_start, _end, _t) {
	// 0 - 0.5: (e + s) * (4 * t^3) + s
	// 0.5 - 1: (e + s) * (-4 * (1 - t)^3 + 1) + s
	var _t2 = _t < 0.5
		? clamp(4 * power(_t, 3), 0, 1)
		: clamp(-4 * power(1 - _t, 3) + 1, 0, 1);
	
	return lerp(_start, _end, _t2);
}