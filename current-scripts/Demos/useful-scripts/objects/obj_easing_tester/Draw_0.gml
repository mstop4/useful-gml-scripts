draw_surface(surf, x, y);
draw_set_valign(fa_middle);
draw_set_font(fnt_demo);
draw_set_colour(c_white);
draw_text(x + surf_width + 10, y + surf_height/2, label);

draw_circle(x + t.v, y + ev, 4, false);