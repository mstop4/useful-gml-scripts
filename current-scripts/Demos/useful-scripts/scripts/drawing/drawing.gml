/// @func    draw_circle_meter(x, y, radius, start_angle, direction, percentage, front_color, back_color, texture, fidelity, alpha)
/// @desc    Draws circular progress meter on a surface
/// @param   surface
/// @param   x          
/// @param   y          
/// @param   radius     
/// @param   start_angle
/// @param   direction    < 0 = clockwise, > 0 = counter-clockwise. Can't be 0.
/// @param   percentage 
/// @param   front_color        
/// @param   back_color
/// @param   sprite    
/// @param   fidelity        
function draw_circle_meter(_surface, _x, _y, _radius, _start_angle, _direction, _percentage, _front_color, _back_color, _sprite, _fidelity) {
	if (!surface_exists(_surface) || _direction == 0) return;

	surface_set_target(_surface);
	draw_clear_alpha(c_black, 0);
	
	var _step_size = 360/_fidelity;
	var _actual_start_angle = _direction > 0 ? _start_angle : _start_angle + 360;
		
	if (sprite_exists(_sprite)) {
		var _texture = sprite_get_texture(_sprite, 0);
		
		// Draw back
		draw_primitive_begin_texture(pr_trianglestrip, _texture);
		
		for (var i=0; i<=360; i+=_step_size) {
			draw_vertex_texture_color(_radius,_radius, 0.5, 0.5, _back_color, 1);
			
			draw_vertex_texture_color(
				_radius + dcos(i)*_radius, _radius - dsin(i)*_radius,
				0.5 + dcos(i) * 0.5, 0.5 - dsin(i) * 0.5,_back_color, 1);
		}
		draw_primitive_end();

		// Draw front
		draw_primitive_begin_texture(pr_trianglestrip, _texture);
    
		for (var i=0; i<=360*_percentage; i+=_step_size) {
			var _angle = _actual_start_angle + i * _direction;
			draw_vertex_texture_color(_radius,_radius, 0.5, 0.5, _front_color, 1);
			
			draw_vertex_texture_color(
				_radius + dcos(_angle)*_radius, _radius - dsin(_angle)*_radius,
				0.5 + dcos(_angle) * 0.5, 0.5 - dsin(_angle) * 0.5,_front_color, 1);
		}
		draw_primitive_end();
	} else {
		// Draw back
		draw_primitive_begin(pr_trianglestrip);
		
		for (var i=0; i<=360; i+=_step_size) {
			draw_vertex_color(_radius, _radius, _back_color, 1);
			
			draw_vertex_color(
				_radius + dcos(i)*_radius, _radius - dsin(i)*_radius,
				_back_color, 1);
		}
		draw_primitive_end();
		
		// Draw front
		draw_primitive_begin(pr_trianglestrip);
    
		for (var i=0; i<=360*_percentage; i+=_step_size) {
			var _angle = _actual_start_angle + i * _direction;
			draw_vertex_color(_radius, _radius, _front_color, 1);
			
			draw_vertex_color(
				_radius + dcos(_angle)*_radius, _radius - dsin(_angle)*_radius,
				_front_color, 1);
		}
		draw_primitive_end();
	}
		
	surface_reset_target();
}


/// @func    draw_curved_meter(x, y, inner_radius, outer_radius, min_angle, max_angle, direction, percentage, front_color, back_color, sprite, fidelity)
/// @desc    Draws circular progress meter on a surface
/// @param   surface
/// @param   x               
/// @param   y               
/// @param   inner_radius    
/// @param   outer_radius        
/// @param   min_angle    
/// @param   max_angle     
/// @param   direction    < 0 = clockwise, > 0 = counter-clockwise. Can't be 0.
/// @param   percentage  
/// @param   front_color     
/// @param   back_color
/// @apram   sprite
/// @param   fidelity        
function draw_curved_meter(_surface, _x, _y, _inner_radius, _outer_radius, _min_angle, _max_angle, _direction, _percentage, _front_color, _back_color, _sprite, _fidelity) {
	if (!surface_exists(_surface) || _direction == 0) return;

	surface_set_target(_surface);
	draw_clear_alpha(c_black, 0);
	
	var _step_size = 360/_fidelity;
	var _inner_outer_ratio = _inner_radius / _outer_radius;
	var _actual_start_angle = _direction > 0 ? _min_angle : _max_angle;
	var _percentage_angle = abs(_max_angle - _min_angle) * _percentage;
		
	if (sprite_exists(_sprite)) {
		var _texture = sprite_get_texture(_sprite, 0);
		
		// Draw back
		draw_primitive_begin_texture(pr_trianglestrip, _texture);
		
		for (var i=_min_angle; i<=_max_angle; i+=_step_size) {
			draw_vertex_texture_color(
				_outer_radius + dcos(i)*_outer_radius, _outer_radius - dsin(i)*_outer_radius,
				0.5 + dcos(i) * 0.5, 0.5 - dsin(i) * 0.5, _back_color, 1);
				
			draw_vertex_texture_color(
				_outer_radius + dcos(i)*_inner_radius, _outer_radius - dsin(i)*_inner_radius,
				0.5 + dcos(i) * 0.5 * _inner_outer_ratio, 0.5 - dsin(i) * 0.5 * _inner_outer_ratio, _back_color, 1);
		}
		draw_primitive_end();

		// Draw front
		draw_primitive_begin_texture(pr_trianglestrip, _texture);
    
		for (var i=0; i<=_percentage_angle; i+=_step_size) {
			var _angle = _actual_start_angle + i * _direction;
			
			draw_vertex_texture_color(
				_outer_radius + dcos(_angle)*_outer_radius, _outer_radius - dsin(_angle)*_outer_radius,
				0.5 + dcos(_angle) * 0.5, 0.5 - dsin(_angle) * 0.5, _front_color, 1);
				
			draw_vertex_texture_color(
				_outer_radius + dcos(_angle)*_inner_radius, _outer_radius - dsin(_angle)*_inner_radius,
				0.5 + dcos(_angle) * 0.5 * _inner_outer_ratio, 0.5 - dsin(_angle) * 0.5 * _inner_outer_ratio, _front_color, 1);
		}
		draw_primitive_end();
	} else {
		// Draw back
		draw_primitive_begin(pr_trianglestrip);
		
		for (var i=_min_angle; i<=_max_angle; i+=_step_size) {
			draw_vertex_color(
				_outer_radius + dcos(i)*_outer_radius, _outer_radius - dsin(i)*_outer_radius,
				_back_color, 1);
				
			draw_vertex_color(
				_outer_radius + dcos(i)*_inner_radius, _outer_radius - dsin(i)*_inner_radius,
				_back_color, 1);
		}
		draw_primitive_end();
		
		// Draw front
		draw_primitive_begin(pr_trianglestrip);
    
		for (var i=0; i<=_percentage_angle; i+=_step_size) {
			var _angle = _actual_start_angle + i * _direction;
			
			draw_vertex_color(
				_outer_radius + dcos(_angle)*_outer_radius, _outer_radius - dsin(_angle)*_outer_radius,
				_front_color, 1);
				
			draw_vertex_color(
				_outer_radius + dcos(_angle)*_inner_radius, _outer_radius - dsin(_angle)*_inner_radius,
				_front_color, 1);
		}
		draw_primitive_end();
	}
		
	surface_reset_target();
}


/// @func    draw_outlined_text(x, y, string, xscale, yscale, angle, inner_color, outline_color, outline_width, alpha, fidelity)
/// @desc    Draws text with outline
/// @param   x          
/// @param   y          
/// @param   string        
/// @param   xscale     
/// @param   yscale     
/// @param   angle      
/// @param   inner_color  
/// @param   outline_color 
/// @param   outline_width  
/// @param   alpha      
/// @param   fidelity   
function draw_outlined_text(_x, _y, _string, _xscale, _yscale, _angle, _inner_color, _outline_color, _outline_width, _alpha, _fidelity) {
	draw_set_color(_outline_color);

	for (var i=0; i<360; i+=360/_fidelity) {
	    draw_text_transformed_color(_x + lengthdir_x(_outline_width * _xscale, i),
	                                 _y + lengthdir_y(_outline_width * _yscale, i),
	                                 _string,_xscale,_yscale,_angle,_outline_color,_outline_color,_outline_color,_outline_color,_alpha);
	}

	draw_text_transformed_color(_x,_y,_string,_xscale,_yscale,_angle,_inner_color,_inner_color,_inner_color,_inner_color,_alpha);
}