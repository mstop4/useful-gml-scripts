for (var i=0; i<num_controls; i++) {
	draw_text(8, i*32 + 16, control_labels[i] + ": " + string(control_manager.players[| 0].ctrl_held[i]));
}