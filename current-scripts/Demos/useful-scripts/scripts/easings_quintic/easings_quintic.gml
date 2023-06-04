/// @func           easing_quintic_in(_start, _end, _t)
/// @desc           quintic interpolation in
/// @param	{real}	_start
/// @param	{real}	_end
/// @param	{real}	_t
function easing_quintic_in(_start, _end, _t) {
	// (e + s) * t^5 + s
	var _t2 = clamp(power(_t, 5), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func           easing_quintic_out(_start, _end, _t)
/// @desc           quintic interpolation in
/// @param	{real}	_start
/// @param	{real}	_end
/// @param	{real}	_t
function easing_quintic_out(_start, _end, _t) {
	// (e + s) * 1 - (1-t)^5 + s
	var _t2 = clamp(1 - power(1-_t, 5), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func           easing_quintic_inout(_start, _end, _t)
/// @desc           quintic interpolation in/out
/// @param	{real}	_start
/// @param	{real}	_end
/// @param	{real}	_t
function easing_quintic_inout(_start, _end, _t) {
	// 0 - 0.5: (e + s) * (8 * t^5) + s
	// 0.5 - 1: (e + s) * (-8 * (1 - t)^5 + 1) + s
	var _t2 = _t < 0.5
		? clamp(16 * power(_t, 5), 0, 1)
		: clamp(-16 * power(1 - _t, 5) + 1, 0, 1); 
	
	return lerp(_start, _end, _t2);
}