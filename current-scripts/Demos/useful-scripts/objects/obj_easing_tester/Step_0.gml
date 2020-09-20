t.update();
ev = surf_height - script_execute(easing_func_id, 0, surf_height, t.v / t.max_v) - 1;

if (t.v < t.max_v) {
	surface_set_target(surf);
	draw_set_colour(c_white);
	draw_point(t.v, ev);
	surface_reset_target();
}