draw_set_colour(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(16, 16, "Useful GML Script Demos");

draw_set_font(fnt_demo);
for (var i=0; i<num_rooms; i++) {
	draw_text(16, 48+32*i, string(i+1) + " - " + string(room_names[i]));
}