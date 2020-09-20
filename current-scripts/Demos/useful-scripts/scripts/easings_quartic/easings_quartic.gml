/// @func            easing_quartic_in(_start, _end, _t)
/// @desc            quartic interpolation in
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_quartic_in(_start, _end, _t) {
	// (e + s) * t^4 + s
	var _t2 = clamp(power(_t, 4), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func            easing_quartic_out(_start, _end, _t)
/// @desc            quartic interpolation in
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_quartic_out(_start, _end, _t) {
	// (e + s) * 1 - (1-t)^4 + s
	var _t2 = clamp(1 - power(1-_t, 4), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func            easing_quartic_inout(_start, _end, _t)
/// @desc            quartic interpolation in/out
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_quartic_inout(_start, _end, _t) {
	// 0 - 0.5: (e + s) * (8 * t^4) + s
	// 0.5 - 1: (e + s) * (-8 * (1 - t)^4 + 1) + s
	var _t2 = _t < 0.5
		? clamp(8 * power(_t, 4), 0, 1)
		: clamp(-8 * power(1 - _t, 4) + 1, 0, 1); 
	
	return lerp(_start, _end, _t2);
}