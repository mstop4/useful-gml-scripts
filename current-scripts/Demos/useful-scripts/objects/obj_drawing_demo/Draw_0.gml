if (!surface_exists(surf)) {
	surf = surface_create(128, 128);
}

var _colour = interpolate_hsv(c_red, c_lime, percentage.v);

draw_circle_meter(surf, 0, 0, 64, percentage.v, _colour, spr_meter, 100);
draw_surface_ext(surf, 32, 32, 1, 1, 0, c_white, alpha.v);