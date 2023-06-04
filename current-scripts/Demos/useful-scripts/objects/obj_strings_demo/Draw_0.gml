draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Strings Demo");

draw_set_halign(fa_left);
draw_text(16, 64, "Split String");
draw_text(640, 64, "Hide Overflow");

draw_set_font(fnt_demo);

// Split String
draw_text(16, 96, original_str);

for (var _i=0; _i<array_length(tokens); _i++) {
	draw_text(16, 128+_i*32, tokens[_i]);
}

// Hide Overflow
draw_text(640, 96, hide_overflow_str);