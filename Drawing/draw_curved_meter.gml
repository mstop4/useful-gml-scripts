/// @func  draw_curved_meter(x, y, inner_radius, angle_offset, max_angle, angle_step, outer_bar_width, percent, inner_color, outer_color)
/// @arg   x               
/// @arg   y               
/// @arg   inner_radius    
/// @arg   angle_offset    
/// @arg   max_angle       
/// @arg   angle_step      
/// @arg   outer_bar_width 
/// @arg   percent         
/// @arg   inner_color     
/// @arg   outer_color     

var _inner_radius = argument[2];
var _angle_offset = argument[3];
var _max_angle = argument[4];
var _angle_step = argument[5];
var _outer_bar_width = argument[6];
var _percent = argument[7];
var _inner_color = argument[8];
var _outer_color = argument[9];

// draw outer back
draw_set_color(c_silver);
draw_set_alpha(1);

draw_primitive_begin(pr_trianglefan);
draw_vertex(_x,_y);

for (var i=_angle_offset+_max_angle; i>=_angle_offset; i-=_angle_step)
{
	draw_vertex(_x+lengthdir_x(_inner_radius+_outer_bar_width,i),_y+lengthdir_y(_inner_radius+_outer_bar_width,i));
}

draw_primitive_end();

// draw outer front
draw_set_color(_outer_color);
draw_set_alpha(1);

draw_primitive_begin(pr_trianglefan);
draw_vertex(_x,_y);

for (var i=_angle_offset+_max_angle; i>=_angle_offset+floor(_max_angle*(1-_percent)); i-=_angle_step)
{
	draw_vertex(_x+lengthdir_x(_inner_radius+_outer_bar_width,i),_y+lengthdir_y(_inner_radius+_outer_bar_width,i));
}

draw_primitive_end();

// draw outer front stroke
draw_set_color(c_black);
draw_set_alpha(1);

draw_primitive_begin(pr_linestrip);
draw_vertex(_x,_y);

for (var i=_angle_offset+_max_angle; i>=_angle_offset+floor(_max_angle*(1-_percent)); i-=_angle_step)
{
	draw_vertex(_x+lengthdir_x(_inner_radius+_outer_bar_width,i),_y+lengthdir_y(_inner_radius+_outer_bar_width,i));
}

draw_vertex(_x,_y);
draw_primitive_end();

// draw outer back stroke
draw_set_color(c_black);
draw_set_alpha(1);

draw_primitive_begin(pr_linestrip);
draw_vertex(_x,_y);

for (var i=_angle_offset+_max_angle; i>=_angle_offset; i-=_angle_step)
{
	draw_vertex(_x+lengthdir_x(_inner_radius+_outer_bar_width,i),_y+lengthdir_y(_inner_radius+_outer_bar_width,i));
}

draw_vertex(_x,_y);
draw_primitive_end();

// draw inner fill
draw_set_color(_inner_color);
draw_set_alpha(1);
draw_circle(_x,_y,_inner_radius,false);

// draw inner stroke 
draw_set_color(c_black);
draw_set_alpha(1);
draw_circle(_x,_y,_inner_radius,true);