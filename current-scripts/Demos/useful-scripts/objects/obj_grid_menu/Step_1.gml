if (active_key_config != noone) {
	var _check_kbm = active_key_config.discovery_mode == CONTROL_TYPE.KEYBOARD_AND_MOUSE && keyboard_check_pressed(vk_anykey);
	var _check_gamepad = active_key_config.discovery_mode == CONTROL_TYPE.GAMEPAD && keyboard_check_pressed(vk_anykey);
	self.handle_key_config_change(active_key_config);
	exit;
}

if (!enabled) exit;

control_state.poll_input();

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	var _cur_pos = pos.y;
	var _item = -1;
	
	do {
		pos.y = wrap(pos.y-1, 0, ds_grid_height(items));
		_item = items[# pos.x, pos.y];
	} until (is_struct(_item) || _cur_pos == pos.y)

	self.grid_menu_update_view();

	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	var _cur_pos = pos.y;
	var _item = -1;
	
	do {
		pos.y = wrap(pos.y+1, 0, ds_grid_height(items));
		_item = items[# pos.x, pos.y];
	} until (is_struct(_item) || _cur_pos == pos.y)
	
	self.grid_menu_update_view();

	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	var _cur_pos = pos.x;
	var _item = items[# pos.x, pos.y];
	
	if (is_struct(_item)) {
		if (ds_list_find_index(_item.types, "spinner") != -1) {
			self.handle_spinner_change(_item, -1);
			return;
		}
	}
	
	do {
		pos.x = wrap(pos.x-1, 0, ds_grid_width(items));
		_item = items[# pos.x, pos.y];
	} until (is_struct(_item) || _cur_pos == pos.x)
	
	self.grid_menu_update_view();

	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.RIGHT]) {
	var _cur_pos = pos.x;
	var _item = items[# pos.x, pos.y];
	
	if (is_struct(_item)) {
		if (ds_list_find_index(_item.types, "spinner") != -1) {
			self.handle_spinner_change(_item, 1);
			return;
		}
	}
	
	do {
		pos.x = wrap(pos.x+1, 0, ds_grid_width(items));
		_item = items[# pos.x, pos.y];
	} until (is_struct(_item) || _cur_pos == pos.x)
	
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
	
	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_confirm(_item);
	
	if (ds_list_find_index(_item.types, "selectable") != -1)
		self.handle_selectable_confirm(_item);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_change(_item);
}