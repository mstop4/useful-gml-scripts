/// @func  draw_outlined_text(x, y, str, xscale, yscale, angle, in_color, out_color, out_width, alpha, fidelity)
/// @arg   x          
/// @arg   y          
/// @arg   str        
/// @arg   xscale     
/// @arg   yscale     
/// @arg   angle      
/// @arg   in_color  
/// @arg   out_color 
/// @arg   out_width  
/// @arg   alpha      
/// @arg   fidelity   

var _x = argument[0];
var _y = argument[1];
var _str = argument[2];
var _xscale = argument[3];
var _yscale = argument[4];
var _angle = argument[5];
var _in_color = argument[6];
var _out_color = argument[7];
var _out_width = argument[8];
var _alpha = argument[9];
var _fidelity = argument[10];

draw_set_color(_out_color);
for (var i=0; i<360; i+=360/4)
	draw_text(_x + lengthdir_x(1, i),
			  _y + lengthdir_y(1, i),
			  _str);
    draw_text_transformed_color(_x + lengthdir_x(_out_width * _xscale, i),
                                 _y + lengthdir_y(_out_width * _yscale, i),
                                 _str,_xscale,_yscale,_angle,_out_color,_out_color,_out_color,_out_color,_alpha);
                                                                
draw_text_transformed_color(_x,_y,_str,_xscale,_yscale,_angle,_in_color,_in_color,_in_color,_in_color,_alpha);