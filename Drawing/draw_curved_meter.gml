/// @desc draw curved meter
/// @param {real} x
/// @param {real} y
/// @param {real} innerRadius
/// @param {real} angleOffset
/// @param {real} maxAngle
/// @param {real} angleStep
/// @param {real} outerBarWidth
/// @param {real} percent
/// @param {real} innerColour
/// @param {real} outerColour

var meter_x = argument[0];
var meter_y = argument[1];
var inner_radius = argument[2];
var angle_offset = argument[3];
var max_angle = argument[4];
var angle_step = argument[5];
var outer_bar_width = argument[6];
var percent = argument[7];
var inner_color = argument[8];
var outer_color = argument[9];

// draw outer back
draw_set_color(c_silver);
draw_set_alpha(1);

draw_primitive_begin(pr_trianglefan);
draw_vertex(meter_x,meter_y);

for (var i=angle_offset+max_angle; i>=angle_offset; i-=angle_step)
{
	draw_vertex(meter_x+lengthdir_x(inner_radius+outer_bar_width,i),meter_y+lengthdir_y(inner_radius+outer_bar_width,i));
}

draw_primitive_end();

// draw outer front
draw_set_color(outer_color);
draw_set_alpha(1);

draw_primitive_begin(pr_trianglefan);
draw_vertex(meter_x,meter_y);

for (var i=angle_offset+max_angle; i>=angle_offset+floor(max_angle*(1-percent)); i-=angle_step)
{
	draw_vertex(meter_x+lengthdir_x(inner_radius+outer_bar_width,i),meter_y+lengthdir_y(inner_radius+outer_bar_width,i));
}

draw_primitive_end();

// draw outer front stroke
draw_set_color(c_black);
draw_set_alpha(1);

draw_primitive_begin(pr_linestrip);
draw_vertex(meter_x,meter_y);

for (var i=angle_offset+max_angle; i>=angle_offset+floor(max_angle*(1-percent)); i-=angle_step)
{
	draw_vertex(meter_x+lengthdir_x(inner_radius+outer_bar_width,i),meter_y+lengthdir_y(inner_radius+outer_bar_width,i));
}

draw_vertex(meter_x,meter_y);
draw_primitive_end();

// draw outer back stroke
draw_set_color(c_black);
draw_set_alpha(1);

draw_primitive_begin(pr_linestrip);
draw_vertex(meter_x,meter_y);

for (var i=angle_offset+max_angle; i>=angle_offset; i-=angle_step)
{
	draw_vertex(meter_x+lengthdir_x(inner_radius+outer_bar_width,i),meter_y+lengthdir_y(inner_radius+outer_bar_width,i));
}

draw_vertex(meter_x,meter_y);
draw_primitive_end();

// draw inner fill
draw_set_color(inner_color);
draw_set_alpha(1);
draw_circle(meter_x,meter_y,inner_radius,false);

// draw inner stroke 
draw_set_color(c_black);
draw_set_alpha(1);
draw_circle(meter_x,meter_y,inner_radius,true);