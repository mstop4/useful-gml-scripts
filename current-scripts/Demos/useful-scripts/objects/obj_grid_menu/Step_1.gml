// Feather disable GM1009
if (!enabled) exit;

control_state.poll_input();

if (active_key_config != noone && discovery_mode == MENU_DISCOVERY_MODE.DISCOVERING) {
	var _item = items[# pos.x, pos.y];	
	self.handle_key_config_discovery(_item);
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
			&& _item.type != "divider")
			|| _cur_pos == pos.y)		

		var _should_scroll = self.grid_menu_update_view().y && (pos.y < _cur_pos);
		if (_should_scroll) self.grid_menu_start_scroll_up();
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
			&& _item.type != "divider")
			|| _cur_pos == pos.y)		
	
		var _should_scroll = self.grid_menu_update_view().y && (pos.y > _cur_pos);
		if (_should_scroll) self.grid_menu_start_scroll_down();
		audio_play_sound(cursor_move_sfx, 1, false);
	}
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	var _cur_pos = pos.x;
	var _item = items[# pos.x, pos.y];

	if (is_struct(_item)) {
		if (_item.type == "spinner") {
			self.handle_spinner_change(_item, -1);
			return;
		}
			
		else if (_item.type == "keyconfig"
			&& active_key_config == _item) {
			self.handle_key_config_select(_item, -1);
			return;
		}
	}

	do {
		pos.x = wrap(pos.x-1, 0, ds_grid_width(items));
		_item = items[# pos.x, pos.y];
	} until ((is_struct(_item)
			&& _item.type != "divider")
			|| _cur_pos == pos.x)		
	
	var _should_scroll = self.grid_menu_update_view().x && (pos.x < _cur_pos);
	if (_should_scroll) self.grid_menu_start_scroll_left();
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.RIGHT]) {
	var _cur_pos = pos.x;
	var _item = items[# pos.x, pos.y];

	if (is_struct(_item)) {
		if (_item.type = "spinner") {
			self.handle_spinner_change(_item, 1);
			return;
		}
			
		else if (_item.type == "keyconfig"
			&& active_key_config == _item) {
			self.handle_key_config_select(_item, -1);
			return;
		}
	}

	do {
		pos.x = wrap(pos.x+1, 0, ds_grid_width(items));
		_item = items[# pos.x, pos.y];
	} until ((is_struct(_item)
			&& _item.type != "divider")
			|| _cur_pos == pos.x)		
	
	var _should_scroll = self.grid_menu_update_view().x && (pos.x > _cur_pos);
	if (_should_scroll) self.grid_menu_start_scroll_right();
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
	
	if (_item.type == "spinner")
		self.handle_spinner_confirm(_item);
	
	else if (_item.type == "selectable")
		self.handle_selectable_confirm(_item);

	else if (_item.type == "valuedSelectable")
		self.handle_valued_selectable_confirm(_item);
		
	else if (_item.type == "keyconfig")
		self.handle_key_config_confirm(_item);
}

if (control_state.pressed_state[MENU_CONTROLS.CANCEL]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
		
	if (_item.type == "keyconfig"
		&& active_key_config == _item)
		self.handle_key_config_cancel(_item);
}

if (control_state.pressed_state[MENU_CONTROLS.DELETE_BINDING]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
		
	if (_item.type == "keyconfig")
		self.handle_key_config_delete(_item);
}