reset_graph = function() {
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	draw_set_colour(c_aqua);
	draw_line(0, 0, 0, surf_height-1);
	draw_set_colour(c_fuchsia);
	draw_line(0, surf_height-1, surf_width, surf_height-1);
	surface_reset_target();
}

surf = surface_create(surf_width, surf_height);
reset_graph();

t = new Tween(0, 1, 0, surf_width, TWEEN_LIMIT_MODE.CEILING, false, pointer_null);
ev = 0;