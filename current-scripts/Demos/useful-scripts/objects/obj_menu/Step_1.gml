control_state.poll_input();

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	pos = wrap(pos-1, 0, num_items-1);
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	pos = wrap(pos+1, 0, num_items-1);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	script_execute(items[| pos].on_confirm, items[| pos].args);
}