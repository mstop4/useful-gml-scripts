/// @func  interpolate_hsv(base_color1, base_color2, t)
/// @arg   base_color1 
/// @arg   base_color2 
/// @arg   t            

var _base_color1 = argument[0];
var _base_color2 = argument[1];
var _t = argument[2];

var temp_hue = lerp(color_get_hue(_base_color1), color_get_hue(_base_color2), _t);
var temp_sat = lerp(color_get_saturation(_base_color1), color_get_saturation(_base_color2), _t);
var temp_val = lerp(color_get_value(_base_color1), color_get_value(_base_color2), _t);
return make_color_rgb(temp_hue, temp_sat, temp_val);