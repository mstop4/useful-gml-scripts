t.update();
ev = surf_height - easing_func(0, surf_height-1, t.v / t.max_v) - 1;

if (t.v < t.max_v) {
	surface_set_target(surf);
	draw_set_colour(c_white);
	draw_point(t.v, ev);
	surface_reset_target();
} else if (alarm[0] == -1) {
	alarm[0] = 60;
}