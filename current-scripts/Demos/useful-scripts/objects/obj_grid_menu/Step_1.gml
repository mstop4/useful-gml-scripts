if (keyboard_check_pressed(vk_anykey)) {
	if (active_key_config != noone) {
		self.handle_key_config(active_key_config);
	}
}

if (!enabled) exit;

control_state.poll_input();

if (control_state.pressed_state[MENU_CONTROLS.UP]) {
	pos.y = wrap(pos.y-1, 0, ds_grid_height(items)-1);
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.DOWN]) {
	pos.y = wrap(pos.y+1, 0, ds_grid_height(items)-1);
	audio_play_sound(cursor_move_sfx, 1, false);
}

if (control_state.pressed_state[MENU_CONTROLS.LEFT]) {
	pos.x = wrap(pos.x-1, 0, ds_grid_width(items)-1);
	audio_play_sound(cursor_move_sfx, 1, false);
	
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;

	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner(_item, -1);
}

if (control_state.pressed_state[MENU_CONTROLS.RIGHT]) {
	pos.x = wrap(pos.x+1, 0, ds_grid_width(items)-1);
	audio_play_sound(cursor_move_sfx, 1, false);
	
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;

	if (ds_list_find_index(_item.types, "spinner") != -1)
		self.handle_spinner(_item, 1);
}

if (control_state.pressed_state[MENU_CONTROLS.CONFIRM]) {
	var _item = items[# pos.x, pos.y];
	if (!is_struct(_item)) return;
	
	if (ds_list_find_index(_item.types, "selectable") != -1)
		self.handle_selectable(_item);
		
	else if (ds_list_find_index(_item.types, "keyconfig") != -1)
		self.handle_key_config(_item);
}