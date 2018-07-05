/// @param base_colour
/// @param variance_hue
/// @param variance_sat
/// @param variance_val

var _base_colour = argument[0];
var _variance_hue = argument[1];
var _variance_sat = argument[2];
var _variance_val = argument[3];

var temp_hue = (color_get_hue(_base_colour) + _variance_hue + 256) mod 256;
var temp_sat = (color_get_saturation(_base_colour) + _variance_sat + 256) mod 256;
var temp_val = (color_get_value(_base_colour) + _variance_val + 256) mod 256;
return make_color_hsv(temp_hue, temp_sat, temp_val);