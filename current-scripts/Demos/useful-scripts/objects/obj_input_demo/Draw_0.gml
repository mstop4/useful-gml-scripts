draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Input Demo");

draw_text(room_width/2, 80, "The last key you pressed was:");
draw_text(room_width/2, 256, "The last button you pressed was:");
draw_set_font(fnt_demo);
draw_text(room_width/2, 112, string(keyboard_lastkey) + " - " + keycode_to_string(keyboard_lastkey));
draw_sprite(spr_keyboard_icons, get_keyboard_icon_index(keyboard_lastkey, spr_keyboard_icons), room_width/2 - icon_half_size, 192 - icon_half_size);

// Feather disable once GM1029
draw_text(room_width/2, 288, string(last_button) + " - " + gamepad_constant_to_string(last_button));
draw_sprite(spr_xbox_series_gamepad_icons, get_gamepad_icon_index(last_button, spr_xbox_series_gamepad_icons), room_width/2 - icon_half_size, 368 - icon_half_size);