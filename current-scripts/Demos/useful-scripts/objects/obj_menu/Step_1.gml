control_state.poll_input();

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	pos = wrap(pos-1, 0, num_items-1);
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	pos = wrap(pos+1, 0, num_items-1);
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	var _item = items[| pos];

	if (ds_list_find_index(_item.types, "spinner") != -1) {
		var _num_values = array_length(_item.values);
		_item.cur_index = wrap(_item.cur_index-1, 0, _num_values-1);
		
		if (script_exists(_item.on_change_func)) {
			script_execute(_item.on_change_func, _item.on_change_args);
		}
		
		if (!_item.silent_on_change && audio_exists(cursor_change_sfx)) {
			audio_play_sound(cursor_change_sfx, 1, false);
		}
	}
}

if (control_state.pressed_state[MENU_CONTROLS.RIGHT]) {
	var _item = items[| pos];

	if (ds_list_find_index(_item.types, "spinner") != -1) {
		var _num_values = array_length(_item.values);
		_item.cur_index = wrap(_item.cur_index+1, 0, _num_values-1);
		
		if (script_exists(_item.on_change_func)) {
			script_execute(_item.on_change_func, _item.on_change_args);
		}
		
		if (!_item.silent_on_change && audio_exists(cursor_change_sfx)) {
			audio_play_sound(cursor_change_sfx, 1, false);
		}
	}
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[| pos];	
	
	if (ds_list_find_index(_item.types, "selectable") != -1) {
		if (script_exists(_item.on_confirm_func)) {
			script_execute(_item.on_confirm_func, _item.on_confirm_args);
		}

		if (!_item.silent_on_confirm && audio_exists(cursor_confirm_sfx)) {
			audio_play_sound(cursor_confirm_sfx, 1, false);
		}
	}
}