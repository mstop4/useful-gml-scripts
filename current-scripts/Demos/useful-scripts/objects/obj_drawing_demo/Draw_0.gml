draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Drawing Demo");

var _colour = interpolate_hsv(c_red, c_lime, percentage.v);

draw_circle_meter(surf_circle, 0, 0, 128, 45, 1, percentage.v, _colour, c_gray, spr_meter, 100);
draw_surface_ext(surf_circle, 32, 64, 1, 1, 0, c_white, alpha.v);

// Feather disable once GM1041
draw_curved_meter(surf_curved, 0, 0, 64, 128, 30, 240, -1, percentage.v, _colour, c_gray, spr_donut_meter, 100);
draw_surface_ext(surf_curved, 320, 64, 1, 1, 0, c_white, alpha.v);

draw_set_font(fnt_graphic);
draw_set_halign(fa_left);
draw_outlined_text(16, 352, "Graphic Design is my passion", 1, 1, 0, c_red, c_lime, 2, 1, 8);