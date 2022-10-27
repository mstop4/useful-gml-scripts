if (!enabled) exit;

control_state.poll_input();

if (active_key_config != noone && discovery_mode == MENU_DISCOVERY_MODE.DISCOVERING) {
	self.handle_key_config_discovery();
	exit;
}

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	if (active_key_config == noone) {
		var _cur_pos = pos.y;
		var _item = -1;
	
		do {
			pos.y = wrap(pos.y-1, 0, ds_grid_height(items));
			_item = items[# pos.x, pos.y];
		} until ((is_struct(_item)
			&& ds_list_find_index(_item.types, "divider") == -1)
			|| _cur_pos == pos.y)		

		self.grid_menu_update_view();

		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	if (active_key_config == noone) {
		var _cur_pos = pos.y;
		var _item = -1;
	
		do {
			pos.y = wrap(pos.y+1, 0, ds_grid_height(items));
			_item = items[# pos.x, pos.y];
		} until ((is_struct(_item)
			&& ds_list_find_index(_item.types, "divider") == -1)
			|| _cur_pos == pos.y)		
	
		self.grid_menu_update_view();

		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	var _cur_pos = pos.x;
	var _item = items[# pos.x, pos.y];

	if (is_struct(_item)) {
		if (ds_list_find_index(_item.types, "spinner") != -1) {
			self.handle_spinner_change(_item, -1);
			return;
		}
			
		else if (ds_list_find_index(_item.types, "keyconfig") != -1
			&& active_key_config == _item) {
			self.handle_key_config_select(_item, -1);
			return;
		}
	}

	do {
		pos.x = wrap(pos.x-1, 0, ds_grid_width(items));
		_item = items[# pos.x, pos.y];
	} until ((is_struct(_item)
			&& ds_list_find_index(_item.types, "divider") == -1)
			|| _cur_pos == pos.x)		
	
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
			
		else if (ds_list_find_index(_item.types, "keyconfig") != -1
			&& active_key_config == _item) {
			self.handle_key_config_select(_item, -1);
			return;
		}
	}

	do {
		pos.x = wrap(pos.x+1, 0, ds_grid_width(items));
		_item = items[# pos.x, pos.y];
	} until ((is_struct(_item)
			&& ds_list_find_index(_item.types, "divider") == -1)
			|| _cur_pos == pos.x)		
	
	self.grid_menu_update_view();
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
	
	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_confirm(_item);
	
	else if (ds_list_find_index(_item.types, "selectable") != -1)
		self.handle_selectable_confirm(_item);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_confirm(_item);
}

if (control_state.pressed_state[MENU_CONTROLS.CANCEL]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
		
	if (ds_list_find_index(_item.types, "keyconfig") != -1
		&& active_key_config == _item)
		self.handle_key_config_cancel();
}

if (control_state.pressed_state[MENU_CONTROLS.DELETE_BINDING]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
		
	if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_delete(_item);
}