/// @func  menu_base_init(menu_font, cursor_spr)
/// @param {Font} menu_font
/// @param {Sprite} cursor_spr
function menu_base_init(_menu_font, _cursor_spr) {
	draw_set_font(_menu_font);
	item_height = string_height("Ij");
	cursor_width = sprite_get_width(_cursor_spr);
}

/// @func  handle_selectable_confirm(item)
/// @param {MenuSelectable} item
function handle_selectable_confirm(_item) {
	if (script_exists(_item.on_confirm_func)) {
		script_execute(_item.on_confirm_func, _item.on_confirm_args);
	}

	if (!_item.silent_on_confirm && audio_exists(cursor_confirm_sfx)) {
		audio_play_sound(cursor_confirm_sfx, 1, false);
	}
}

/// @func  handle_spinner_confirm(item)
/// @param {MenuSpinner} item
function handle_spinner_confirm(_item) {
	if (script_exists(_item.on_confirm_func)) {
		script_execute(_item.on_confirm_func, _item.cur_index, _item.values[_item.cur_index], _item.on_confirm_args);
	}

	if (!_item.silent_on_confirm && audio_exists(cursor_confirm_sfx)) {
		audio_play_sound(cursor_confirm_sfx, 1, false);
	}
}

/// @func  handle_spinner_change(item, direction)
/// @param {MenuSpinner} item
/// @param {number} direction -1 or 1
function handle_spinner_change(_item, _direction) {
	var _num_values = array_length(_item.values);
	_item.cur_index = wrap(_item.cur_index+_direction, 0, _num_values-1);
		
	if (script_exists(_item.on_change_func)) {
		script_execute(
			_item.on_change_func,
			_item.cur_index,
			_item.values[_item.cur_index],
			_direction,
			_item.on_change_args
		);
	}
		
	if (!_item.silent_on_change && audio_exists(cursor_change_sfx)) {
		audio_play_sound(cursor_change_sfx, 1, false);
	}
}

/// @func  handle_key_config_change(item)
/// @param {MenuSpinner} item
function handle_key_config_change(_item) {
	if (_item.discovery_mode) {
		_item.keycode = keyboard_key;
		_item.discovery_mode = false;
		self.active_key_config = noone;
		self.enabled = true;
		
		if (script_exists(_item.on_change_func)) {
			script_execute(_item.on_change_func, keyboard_key, _item.on_change_args);
		}

		io_clear();
	} else {
		_item.discovery_mode = true;
		self.enabled = false;
		self.active_key_config = _item;
		io_clear();
	}
}