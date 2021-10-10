for (var i=0; i<num_controls; i++) {
	draw_text(8, i*32 + 16, string(control_labels[i]) + ": " + string(my_player.get_control_state(i, CONTROL_STATE.HELD)));
}

// for (i=0; i<8; i++) {
// 	draw_text(640, i*32, string(device_mouse_x(i)) + ", " + string(device_mouse_y(i)));
// }