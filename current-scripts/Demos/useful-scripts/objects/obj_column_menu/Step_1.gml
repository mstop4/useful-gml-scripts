if (!enabled) exit;

control_state.poll_input();

if (active_key_config != noone && discovery_mode == MENU_DISCOVERY_MODE.DISCOVERING) {
	var _item = items[| pos];	
	self.handle_key_config_discovery(_item);
	exit;
}

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	if (active_key_config == noone) {
		var _cur_pos = pos;
		var _item = -1;
	
		do {
			pos = wrap(pos-1, 0, num_items);
			_item = items[| pos];
		} until ((is_struct(_item)
			&& ds_list_find_index(_item.types, "divider") == -1)
			|| _cur_pos == pos)
		
		var _should_scroll = self.column_menu_update_view() && (pos < _cur_pos);
		if (_should_scroll) self.menu_base_start_scroll_up();
		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	if (active_key_config == noone) {
		var _cur_pos = pos;
		var _item = -1;
	
		do {
			pos = wrap(pos+1, 0, num_items);
			_item = items[| pos];
		} until ((is_struct(_item)
			&& ds_list_find_index(_item.types, "divider") == -1)
			|| _cur_pos == pos)		
		
		var _should_scroll = self.column_menu_update_view() && (pos > _cur_pos);
		if (_should_scroll) self.menu_base_start_scroll_down();
		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	var _item = items[| pos];

	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_change(_item, -1);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1
		&& active_key_config == _item)
		self.handle_key_config_select(_item, -1);
}

if (control_state.pressed_state[MENU_CONTROLS.RIGHT]) {
	var _item = items[| pos];

	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_change(_item, 1);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1
		&& active_key_config == _item)
		self.handle_key_config_select(_item, 1);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[| pos];	
	
	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner_confirm(_item);
	
	else if (ds_list_find_index(_item.types, "selectable") != -1)
		self.handle_selectable_confirm(_item);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_confirm(_item);
}

if (control_state.pressed_state[MENU_CONTROLS.CANCEL]) {
	var _item = items[| pos];	
		
	if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_cancel(_item);
}

if (control_state.pressed_state[MENU_CONTROLS.DELETE_BINDING]) {
	var _item = items[| pos];	
		
	if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config_delete(_item);
}