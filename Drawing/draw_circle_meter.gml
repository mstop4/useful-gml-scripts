/// @func  draw_circle_meter(x, y, radius, percentage, col, texture, fidelity, alpha)
/// @arg   x          
/// @arg   y          
/// @arg   radius     
/// @arg   percentage 
/// @arg   color        
/// @arg   texture    
/// @arg   fidelity   
/// @arg   alpha      

var _x = argument[0];
var _y = argument[1];
var _radius = argument[2];
var _percentage = argument[3];
var _color = argument[4];
var _texture = argument[5];
var _fidelity = argument[6];
var _alpha = argument[7];

if (!surface_exists(meter_surf))
	meter_surf = surface_create(_radius*2,_radius*2);

surface_set_target(meter_surf);
	draw_clear_alpha(c_black,0);
	var _stretch = _radius*2 / 96;
	draw_sprite_ext(_texture,0,0,0,_stretch,_stretch,0,c_gray,1);

	var _tex = sprite_get_texture(_texture,0);
	draw_set_color(_color);
	draw_primitive_begin_texture(pr_trianglefan,_tex);
	draw_vertex_texture_color(_radius,_radius,0.5,0.5,_color,1);
    
	for (var i=270; i<=360*_percentage+270; i+=360/_fidelity)
	{
	    draw_vertex_texture_color(_radius+dcos(i)*_radius, _radius+dsin(i)*_radius,
	                                0.5+dcos(i)*0.5, 0.5+dsin(i)*0.5,_color,1);
	}
    
	draw_primitive_end();
surface_reset_target();

draw_surface_ext(meter_surf,_x,_y,1,1,0,c_white,_alpha);