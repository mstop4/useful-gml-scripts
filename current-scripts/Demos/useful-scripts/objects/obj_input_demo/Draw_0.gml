draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Input Demo");

draw_text(room_width/2, 80, "The last key you pressed was:");
draw_set_font(fnt_demo);
draw_text(room_width/2, 112, string(keyboard_lastkey) + " - " + keycode_to_string(keyboard_lastkey));