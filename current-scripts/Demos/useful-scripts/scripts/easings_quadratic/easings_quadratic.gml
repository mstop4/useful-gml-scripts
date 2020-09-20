/// @func            easing_quadratic_in(_start, _end, _t)
/// @desc            quadratic interpolation in
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_quadratic_in(_start, _end, _t) {
	// (e + s) * _t^2 + s
	var _t2 = clamp(power(_t, 2), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func            easing_quadratic_out(_start, _end, _t)
/// @desc            quadratic interpolation in
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_quadratic_out(_start, _end, _t) {
	// (e + s) * 1 - (1-t)^2 + s
	var _t2 = clamp(1 - power(1-_t, 2), 0, 1);
	return lerp(_start, _end, _t2);
}


/// @func            easing_quadratic_inout(_start, _end, _t)
/// @desc            quadratic interpolation in/out
/// @param	{number} start
/// @param	{number} end
/// @param	{number} t
function easing_quadratic_inout(_start, _end, _t) {
	// 0 - 0.5: (e + s) * (2 * t^2) + s
	// 0.5 - 1: (e + s) * (-2 * (1-t)^2 + 1) + sW
	var _t2 = _t < 0.5
		? clamp(2 * power(_t, 2), 0, 1)
		: clamp(-2 * power(1 - _t, 2) + 1, 0, 1); 
	
	return lerp(_start, _end, _t2);
}