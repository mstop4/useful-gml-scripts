if (!surface_exists(surf_circle)) {
	surf_circle = surface_create(256, 256);
}

if (!surface_exists(surf_curved)) {
	surf_curved = surface_create(256, 256);
}

var _colour = interpolate_hsv(c_red, c_lime, percentage.v);

draw_circle_meter(surf_circle, 0, 0, 128, 45, -1, percentage.v, _colour, c_gray, spr_meter, 100);
draw_surface_ext(surf_circle, 32, 32, 1, 1, 0, c_white, alpha.v);

draw_curved_meter(surf_curved, 0, 0, 64, 128, 30, 240, -1, percentage.v, _colour, c_gray, spr_donut_meter, 100);
draw_surface_ext(surf_curved, 320, 32, 1, 1, 0, c_white, alpha.v);

draw_set_font(fnt_graphic);
draw_outlined_text(16, 320, "Graphic Design is my passion", 1, 1, 0, c_red, c_lime, 2, 1, 8);