/// @func           interpolate_hsv(base_color1, base_color2, t)
/// @desc           Returns interpolated colour between two HSV colours
/// @param {colour} base_color1
/// @param {colour} base_color2
/// @param {real}   t
function interpolate_hsv(_base_color1, _base_color2, _t) {
	var temp_hue = lerp(color_get_hue(_base_color1), color_get_hue(_base_color2), _t);
	var temp_sat = lerp(color_get_saturation(_base_color1), color_get_saturation(_base_color2), _t);
	var temp_val = lerp(color_get_value(_base_color1), color_get_value(_base_color2), _t);

	return make_color_rgb(temp_hue, temp_sat, temp_val);
}

// NOTE: interpolate_rgb is DEPRECATED. It is redundant since duplicates the native GML
//       function merge_colour.

/// @func           interpolate_rgb(base_color1, base_color2, t)
/// @desc           Returns interpolated colour between two RGB colours
/// @param {colour} base_color1
/// @param {colour} base_color2
/// @param {real}   t
function interpolate_rgb(_base_color1, _base_color2, _t) {
	var temp_red = lerp(color_get_red(_base_color1), color_get_red(_base_color2), _t);
	var temp_green = lerp(color_get_green(_base_color1), color_get_green(_base_color2), _t);
	var temp_blue = lerp(color_get_blue(_base_color1), color_get_blue(_base_color2), _t);

	return make_color_rgb(temp_red, temp_green, temp_blue);
}


/// @func           rgb_to_bgr(rgb)
/// @desc           Converts RGB int/hex to BGR real
/// @param {colour} rgbColour
function rgb_to_bgr(_rgbColour) {
	return (_rgbColour & $FF) << 16 | (_rgbColour & $FF00) | (_rgbColour & $FF0000) >> 16;
}


/// @func    vary_color_hsv(base_color, variance_hue, variance_sat, variance_val)
/// @desc    Shifts the components of an HSV colour
/// @param   base_color  
/// @param   variance_hue 
/// @param   variance_sat 
/// @param   variance_val 
function vary_color_hsv(_base_color, _variance_hue, _variance_sat, _variance_val) {
	var temp_hue = (color_get_hue(_base_color) + _variance_hue + 256) mod 256;
	var temp_sat = (color_get_saturation(_base_color) + _variance_sat + 256) mod 256;
	var temp_val = (color_get_value(_base_color) + _variance_val + 256) mod 256;

	return make_color_hsv(temp_hue, temp_sat, temp_val);
}