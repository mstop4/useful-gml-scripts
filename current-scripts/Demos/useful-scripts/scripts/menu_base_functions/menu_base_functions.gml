/// @func  menu_base_init(config)
/// @param {Struct} config
///								 - {} player_controller
///								 - {Font} font
///								 - {Sprite} cursor_spr
///								 - {boolean} use_control_icons
///								 - {Array.<Sprite>} keyboard_icons
///								 - {Array.<Sprite>} gamepad_icons
///								 - {number} control_icons_scale
function menu_base_init(_config) {
	player_controller = _config.player_controller;
	control_state = new MenuControlState(_config.player_controller);
	var _old_font = draw_get_font();
	draw_set_font(_config.font);
	item_height = string_height("Ij");
	cursor_width = sprite_get_width(_config.cursor_spr);
	cursor_height = sprite_get_height(_config.cursor_spr);
	draw_set_font(_old_font);
	use_control_icons = _config.use_control_icons;
	keyboard_icons = _config.keyboard_icons;
	gamepad_icons = _config.gamepad_icons;
	keyboard_icons_index = 0;
	gamepad_icons_index = 0;
	control_icons_scale = _config.control_icons_scale;
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

/// @func  handle_key_config_select(item, delta)
/// @param {MenuKeyConfig} item
/// @param {number} delta
function handle_key_config_select(_item, _delta) {
	var _num_values = KEYBOARD_MAX_BINDINGS_PER_CONTROL + GAMEPAD_MAX_BINDINGS_PER_CONTROL;
	_item.current_binding_index = wrap(_item.current_binding_index+_delta, 0, _num_values);
	
	if (!_item.silent_on_change && audio_exists(cursor_change_sfx)) {
		audio_play_sound(cursor_change_sfx, 1, false);
	}
}

/// @func  handle_key_config_confirm(item)
/// @param {MenuKeyConfig} item
function handle_key_config_confirm(_item) {
	if (discovery_mode == MENU_DISCOVERY_MODE.NONE) {
		// Not selected
		_item.current_binding_index = 0;
		discovery_mode = MENU_DISCOVERY_MODE.SELECTING;
		self.active_key_config = _item;
	} else if (discovery_mode == MENU_DISCOVERY_MODE.SELECTING) {
		// Selecting
		var _last_pressed = control_state.control_any_pressed();
		var _binding_info = _item.get_binding_info();
		
		if (_last_pressed.control_type != _binding_info.control_type) return;		
		if (_binding_info.binding_locked) return;

		discovery_mode = MENU_DISCOVERY_MODE.DISCOVERING;
		_item.discovery_binding_info = _binding_info;
		io_clear();
	}
}

/// @func handle_key_config_cancel()
function handle_key_config_cancel() {
	if (discovery_mode == MENU_DISCOVERY_MODE.SELECTING) {
		discovery_mode = MENU_DISCOVERY_MODE.NONE;
		self.active_key_config = noone;		
	}
}

/// @func handle_key_config_delete()
function handle_key_config_delete(_item) {
	var _binding_info = _item.get_binding_info();
	if (_binding_info.binding_locked) return;
	
	var _control_index = _binding_info.control_index;
	var _control_type = _binding_info.control_type;
	var _binding_key = "";

	if (_control_type == CONTROL_TYPE.KEYBOARD_AND_MOUSE) {
		_binding_key = "kbm_bindings";
	} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
		_binding_key = "gamepad_bindings";
	} else {
		return;
	}
	
	_item[$ _binding_key][_control_index] = -1;
	player_controller.remove_binding(_control_type, _item.control, _control_index);
	
	discovery_mode = MENU_DISCOVERY_MODE.NONE;
}

/// @func handle_key_config_discovery()
function handle_key_config_discovery() {
	if (control_state.pressed_state[MENU_CONTROLS.CANCEL]) {
		discovery_mode = MENU_DISCOVERY_MODE.SELECTING;
		active_key_config.discovery_binding_info = false;
		return;
	}

	var _control_type = active_key_config.discovery_binding_info.control_type;
	var _last_pressed = control_state.control_any_pressed();		
	
	if (_last_pressed != -1 && _last_pressed.control_type == _control_type) {
		var _control_index = active_key_config.discovery_binding_info.control_index;
		var _binding_key = "";		
		
		if (_control_type == CONTROL_TYPE.KEYBOARD_AND_MOUSE) {
			if (array_find(global.disallowed_keyboard_controls, _last_pressed.control_pressed) != -1) return;
			_binding_key = "kbm_bindings";
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			if (array_find(global.disallowed_gamepad_controls, _last_pressed.control_pressed) != -1) return;
			_binding_key = "gamepad_bindings";
		} else {
			return;
		}		
		
		active_key_config[$ _binding_key][_control_index] = _last_pressed.control_pressed;
		player_controller.set_binding(_control_type, _last_pressed.control_source, active_key_config.control, _control_index, _last_pressed.control_pressed);
		discovery_mode = MENU_DISCOVERY_MODE.NONE;
		active_key_config.discovery_binding_info = false;

		if (script_exists(self.active_key_config.on_change_func)) {
			script_execute(self.active_key_config.on_change_func, _control_type, _last_pressed.control_source, active_key_config.control, _control_index, _last_pressed.control_pressed, self.active_key_config.on_change_args);
		}

		self.active_key_config = noone;
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
		var _cur_x = _x + label_width;
		var _cur_binding_index = 0;
		
		// Draw keyboard bindings
		for (var i=0; i<KEYBOARD_MAX_BINDINGS_PER_CONTROL; i++) {
			if (use_control_icons) {
				var _item_icon_index = _item.get_icon_index(CONTROL_TYPE.KEYBOARD_AND_MOUSE, i);
				var _blend = _item.locked_kbm_bindings[i] ? c_grey : c_white;
				draw_sprite_ext(keyboard_icons[keyboard_icons_index], _item_icon_index, _cur_x, _y, control_icons_scale, control_icons_scale, 0, _blend, 1);
			} else {
				var _item_value = _item.get_text_value(CONTROL_TYPE.KEYBOARD_AND_MOUSE, i);
				if (_item.locked_kbm_bindings[i]) {
					draw_set_colour(c_gray);
				} else {
					draw_set_colour(c_white);
				}
				draw_text(_cur_x, _y, _item_value);
			}

			if (discovery_mode != MENU_DISCOVERY_MODE.NONE
				&& active_key_config == _item
				&& _cur_binding_index == _item.current_binding_index) {
				draw_sprite(sub_cursor_spr, 0, _cur_x - cursor_padding, _y + item_height / 2);
			}
			
			_cur_x += binding_spacing;
			_cur_binding_index++;
		}
		
		_cur_x += binding_type_spacing;
		
		// Draw gamepad bindings
		for (var i=0; i<GAMEPAD_MAX_BINDINGS_PER_CONTROL; i++) {
			if (use_control_icons) {
				var _item_icon_index = _item.get_icon_index(CONTROL_TYPE.GAMEPAD, i);
				var _blend = _item.locked_gamepad_bindings[i] ? c_grey : c_white;
				draw_sprite_ext(gamepad_icons[gamepad_icons_index], _item_icon_index, _cur_x, _y, control_icons_scale, control_icons_scale, 0, _blend, 1);
			} else {
				var _item_value = _item.get_text_value(CONTROL_TYPE.GAMEPAD, i);
				if (_item.locked_gamepad_bindings[i]) {
					draw_set_colour(c_gray);
				} else {
					draw_set_colour(c_white);
				}			
			
				draw_text(_cur_x, _y, _item_value);
			}
			
			if (discovery_mode != MENU_DISCOVERY_MODE.NONE
				&& active_key_config == _item
				&& _cur_binding_index == _item.current_binding_index) {
				draw_sprite(sub_cursor_spr, 0, _cur_x - cursor_padding, _y + item_height / 2);
			}			
	
			_cur_x += binding_spacing;
			_cur_binding_index++;
		}
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