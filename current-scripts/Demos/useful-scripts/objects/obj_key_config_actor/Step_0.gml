if (active) {
	var _h_input = my_player.get_control_state(CONTROLS.RIGHT, CONTROL_STATE.HELD) - my_player.get_control_state(CONTROLS.LEFT, CONTROL_STATE.HELD);
	var _v_input = my_player.get_control_state(CONTROLS.DOWN, CONTROL_STATE.HELD) - my_player.get_control_state(CONTROLS.UP, CONTROL_STATE.HELD);

	x += _h_input;
	y += _v_input;
}