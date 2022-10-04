/// @func  menu_base_init(player_controller, menu_font, cursor_spr)
/// @param {} player_controller
/// @param {Font} menu_font
/// @param {Sprite} cursor_spr
function menu_base_init(_player_controller, _menu_font, _cursor_spr) {
	player_controller = _player_controller;
	control_state = new MenuControlState(_player_controller);
	var _old_font = draw_get_font();
	draw_set_font(_menu_font);
	item_height = string_height("Ij");
	cursor_width = sprite_get_width(_cursor_spr);
	cursor_height = sprite_get_height(_cursor_spr);
	draw_set_font(_old_font);
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

/// @func  handle_spinner_change(item, delta)
/// @param {MenuSpinner} item
/// @param {number} delta -1 or 1
function handle_spinner_change(_item, _delta) {
	var _num_values = array_length(_item.values);
	_item.cur_index = wrap(_item.cur_index+_delta, 0, _num_values);
		
	if (script_exists(_item.on_change_func)) {
		script_execute(
			_item.on_change_func,
			_item.cur_index,
			_item.values[_item.cur_index],
			_delta,
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
	if (_item.discovery_mode != CONTROL_TYPE.NONE) {
		_item.keycode = keyboard_key;
		_item.discovery_mode = CONTROL_TYPE.NONE;
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

function menu_base_draw_item(_item, _x, _y) {
	var _type = _item.types[| ds_list_size(_item.types)-1];

	switch (_type) {
		case "item":
		case "selectable":
			draw_text(_x, _y, _item.label);
			break;
			
	case "spinner":
		draw_text(_x, _y, _item.label);
		draw_text(_x + label_width, _y, _item.get_value());
		break;
			
	case "keyconfig":
		draw_text(_x, _y, _item.label);
		draw_text(_x + label_width, _y, _item.get_value(CONTROL_TYPE.KEYBOARD_AND_MOUSE, 0));
		break;
		
		default:
			draw_text(_x, _y, _item.label);
	}
}

function menu_switch(_next_menu, _on_switch_cb, _on_switch_cb_args) {
	enabled = false;
	self.menu_fade_out(_next_menu, _on_switch_cb, _on_switch_cb_args);
}

function menu_fade_out(_next_menu, _on_end_cb, _on_end_cb_args) {
	next_menu = _next_menu;
	on_fade_out_end = asset_get_index(_on_end_cb);
	on_fade_out_end_args = _on_end_cb_args;
	menu_alpha.v = 1;
	menu_alpha.d = -1/menu_fade_time;
	alarm[11] = menu_fade_time;
}

function menu_fade_in() {
	visible = true;
	menu_alpha.v = 0;
	menu_alpha.d = 1/menu_fade_time;
	alarm[10] = menu_fade_time;
}