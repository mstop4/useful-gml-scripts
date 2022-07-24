draw_set_font(fnt_title);
draw_set_colour(c_white);
draw_text(16, 16, "Control Manager Demo");

for (var i=0; i<num_controls; i++) {
	var _pressed = my_player.get_control_state(i, CONTROL_STATE.HELD);
	var _text_colour = _pressed ? c_lime : c_white;
	
	draw_set_colour(_text_colour);
	draw_text(8, i*52 + 96, string(control_labels[i]));
	var _num_prompts = array_length(control_prompts[i]);
	
	for (var j=0; j<_num_prompts; j++) {
		draw_sprite(spr_prompts, control_prompts[i][j], 160 + j*52, i*52 + 104);
	}
}

// for (i=0; i<8; i++) {
// 	draw_text(640, i*32, string(device_mouse_x(i)) + ", " + string(device_mouse_y(i)));
// }