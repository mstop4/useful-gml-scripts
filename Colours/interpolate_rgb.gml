/// @func  interpolate_rgb(base_colour1, base_colour2, t)
/// @arg   base_colour1 
/// @arg   base_colour2 
/// @arg   t            

var _base_colour1 = argument[0];
var _base_colour2 = argument[1];
var _t = argument[2];

/* Script body goes here */
var temp_red = lerp(color_get_red(_base_colour1), color_get_red(_base_colour2), _t);
var temp_green = lerp(color_get_green(_base_colour1), color_get_green(_base_colour2), _t);
var temp_blue = lerp(color_get_blue(_base_colour1), color_get_blue(_base_colour2), _t);
return make_color_rgb(temp_red, temp_green, temp_blue);