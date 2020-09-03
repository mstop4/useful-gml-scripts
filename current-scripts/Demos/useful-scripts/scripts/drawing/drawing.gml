/// @func    draw_circle_meter(x, y, radius, percentage, col, texture, fidelity, alpha)
/// @desc    Draws circular progress meter on a surface
/// @param   surface
/// @param   x          
/// @param   y          
/// @param   radius     
/// @param   percentage 
/// @param   color        
/// @param   sprite    
/// @param   fidelity        
function draw_circle_meter(_surface, _x, _y, _radius, _percentage, _color, _sprite, _fidelity) {
	if (!surface_exists(_surface)) return;

	surface_set_target(_surface);
		draw_clear_alpha(c_black, 0);
		var _stretch = _radius*2 / sprite_get_width(_sprite);
		draw_sprite_ext(_sprite, 0, 0, 0, 1, 1, 0, c_gray, 1);

		var _texture = sprite_get_texture(_sprite, 0);
		draw_set_color(_color);
		draw_primitive_begin_texture(pr_trianglefan, _texture);
		draw_vertex_texture_color(_radius,_radius, 0.5, 0.5, _color, 1);
    
		for (var i=270; i<=360*_percentage+270; i+=360/_fidelity) {
			draw_vertex_texture_color(
				_radius + dcos(i) * _radius, _radius+dsin(i)*_radius,
				0.5 + dcos(i) * 0.5, 0.5 + dsin(i) * 0.5,_color, 1);
		}
    
		draw_primitive_end();
	surface_reset_target();
}