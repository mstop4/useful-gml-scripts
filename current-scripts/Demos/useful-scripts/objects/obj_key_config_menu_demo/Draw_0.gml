draw_set_font(fnt_title);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Control Config Menu Demo");
draw_text(224, 56, "Keyboard");
draw_text(448, 56, "Gamepad");

draw_set_font(fnt_demo);
draw_set_halign(fa_left);
draw_text(32, 256, "Press Tab to switch between configuring and testing the controls.");