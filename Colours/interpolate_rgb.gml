/// @func  interpolate_rgb(base_color1, base_color2, t)
/// @arg   base_color1 
/// @arg   base_color2 
/// @arg   t            

var _base_color1 = argument[0];
var _base_color2 = argument[1];
var _t = argument[2];

var temp_red = lerp(color_get_red(_base_color1), color_get_red(_base_color2), _t);
var temp_green = lerp(color_get_green(_base_color1), color_get_green(_base_color2), _t);
var temp_blue = lerp(color_get_blue(_base_color1), color_get_blue(_base_color2), _t);
return make_color_rgb(temp_red, temp_green, temp_blue);