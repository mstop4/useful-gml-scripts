/// @func           interpolate_hsv(base_color1, base_color2, t)
/// @desc           Returns interpolated colour between two HSV colours
/// @param {real} _base_color1 colour
/// @param {real} _base_color2 colour
/// @param {real} _t
function interpolate_hsv(_base_color1, _base_color2, _t) {
	var _temp_hue = lerp(color_get_hue(_base_color1), color_get_hue(_base_color2), _t);
	var _temp_sat = lerp(color_get_saturation(_base_color1), color_get_saturation(_base_color2), _t);
	var _temp_val = lerp(color_get_value(_base_color1), color_get_value(_base_color2), _t);

	return make_color_hsv(_temp_hue, _temp_sat, _temp_val);
}

// NOTE: interpolate_rgb is DEPRECATED. It is redundant since duplicates the native GML
//       function merge_colour.

/// @func           interpolate_rgb(base_color1, base_color2, t)
/// @desc           Returns interpolated colour between two RGB colours
/// @deprecated
/// @param {real} _base_color1 colour
/// @param {real} _base_color2 colour
/// @param {real} _t
function interpolate_rgb(_base_color1, _base_color2, _t) {
	var _temp_red = lerp(color_get_red(_base_color1), color_get_red(_base_color2), _t);
	var _temp_green = lerp(color_get_green(_base_color1), color_get_green(_base_color2), _t);
	var _temp_blue = lerp(color_get_blue(_base_color1), color_get_blue(_base_color2), _t);

	return make_color_rgb(_temp_red, _temp_green, _temp_blue);
}


/// @func           rgb_to_bgr(rgb)
/// @desc           Converts RGB int/hex to BGR real
/// @param {real} _rgb_colour colour
function rgb_to_bgr(_rgb_colour) {
	return (_rgb_colour & $FF) << 16 | (_rgb_colour & $FF00) | (_rgb_colour & $FF0000) >> 16;
}

/// @func           rgb_hex_string_to_real(hex_str)
/// @desc           Converts RGB hex string to a real
/// @param {string} _hex_str
function rgb_hex_string_to_real(_hex_str) {
	if (!is_string(_hex_str)) return -1;
	var _str_len = string_length(_hex_str);
	var _value = 0;
	
	for (var i=_str_len; i>0; i--) {
		_value = _value << 4;
		var _char = string_upper(string_copy(_hex_str, i, 1));
		
		if (_char == "#") continue;
		var _ord = ord(_char);
		
		if (_ord >= ord("A") && _ord <= ord("F")) {
			_value += _ord - ord("A") + 10;
		} else if (_ord >= ord("0") && _ord <= ord("9")) {
			_value += real(_char);
		}
	}
	
	return _value;
}

/// @func    vary_color_hsv(base_color, variance_hue, variance_sat, variance_val)
/// @desc    Shifts the components of an HSV colour
/// @param   _base_color  
/// @param   _variance_hue 
/// @param   _variance_sat 
/// @param   _variance_val 
function vary_color_hsv(_base_color, _variance_hue, _variance_sat, _variance_val) {
	var _temp_hue = (color_get_hue(_base_color) + _variance_hue + 256) mod 256;
	var _temp_sat = (color_get_saturation(_base_color) + _variance_sat + 256) mod 256;
	var _temp_val = (color_get_value(_base_color) + _variance_val + 256) mod 256;

	return make_color_hsv(_temp_hue, _temp_sat, _temp_val);
}