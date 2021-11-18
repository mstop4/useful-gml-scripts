if (keyboard_check_pressed(vk_anykey)) {
	if (active_key_config != noone) {
		self.handle_key_config_change(active_key_config);
	}
}

if (!enabled) exit;

control_state.poll_input();

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	pos = wrap(pos-1, 0, num_items);
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	pos = wrap(pos+1, 0, num_items);
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	var _item = items[| pos];

	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_change(_item, -1);
}

if (control_state.pressed_state[MENU_CONTROLS.RIGHT]) {
	var _item = items[| pos];

	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_change(_item, 1);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[| pos];	
	
	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_confirm(_item);
	
	else if (ds_list_find_index(_item.types, "selectable") != -1)
		self.handle_selectable_confirm(_item);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_change(_item);
}