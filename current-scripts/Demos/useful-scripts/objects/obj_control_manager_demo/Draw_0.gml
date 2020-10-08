for (var i=0; i<num_controls; i++) {
	draw_text(8, i*32 + 16, control_labels[i] + ": " + string(my_player.get_control_state(i, CONTROL_STATE.HELD)));
}