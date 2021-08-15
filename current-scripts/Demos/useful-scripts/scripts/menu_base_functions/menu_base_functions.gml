/// @func  handle_selectable(item)
/// @param {MenuSelectable} item
function handle_selectable(_item) {
	if (script_exists(_item.on_confirm_func)) {
		script_execute(_item.on_confirm_func, _item.on_confirm_args);
	}

	if (!_item.silent_on_confirm && audio_exists(cursor_confirm_sfx)) {
		audio_play_sound(cursor_confirm_sfx, 1, false);
	}
}

/// @func  handle_spinner(item, direction)
/// @param {MenuSpinner} item
/// @param {number} direction -1 or 1
function handle_spinner(_item, _direction) {
	var _num_values = array_length(_item.values);
	_item.cur_index = wrap(_item.cur_index+_direction, 0, _num_values-1);
		
	if (script_exists(_item.on_change_func)) {
		script_execute(_item.on_change_func, _item.on_change_args);
	}
		
	if (!_item.silent_on_change && audio_exists(cursor_change_sfx)) {
		audio_play_sound(cursor_change_sfx, 1, false);
	}
}