if (keyboard_check_pressed(vk_anykey)) {
	if (active_key_config != noone) {
		self.handle_key_config_change(active_key_config);
	}
}

if (!enabled) exit;

control_state.poll_input();

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	if (active_item == noone) {
		pos = wrap(pos-1, 0, num_items);
		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	if (active_item == noone) {
		pos = wrap(pos+1, 0, num_items);
		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	if (active_item == noone) {
		nested_menu_toggle_submenu_by_index(self, pos);
		io_clear();
	}
}

if (control_state.pressed_state[MENU_CONTROLS.CANCEL]) {
	if (active_item != noone) {
		// Check if active menu has a key config in discovery mode
		var _submenu = active_item.submenu;
		if (_submenu.active_key_config != noone) exit;
		
		nested_menu_toggle_submenu_by_index(self, -1);
		io_clear();
	}
}