enum MENU_CONTROLS {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CONFIRM,
	CANCEL,
	MAX
}

function MenuControlState() constructor {
	pressed_state = [];
	held_state = [];
	
	for (var i=0; i< MENU_CONTROLS.MAX; i++) {
		pressed_state[i] = false;
		held_state[i] = false;
	}
	
	function poll_input() {
		pressed_state[MENU_CONTROLS.UP] = keyboard_check_pressed(vk_up);
		pressed_state[MENU_CONTROLS.DOWN] = keyboard_check_pressed(vk_down);
		pressed_state[MENU_CONTROLS.LEFT] = keyboard_check_pressed(vk_left);
		pressed_state[MENU_CONTROLS.RIGHT] = keyboard_check_pressed(vk_right);
		pressed_state[MENU_CONTROLS.CONFIRM] = keyboard_check_pressed(vk_enter);
		pressed_state[MENU_CONTROLS.CANCEL] = keyboard_check_pressed(vk_backspace);
	
		held_state[MENU_CONTROLS.UP] = keyboard_check(vk_up);
		held_state[MENU_CONTROLS.DOWN] = keyboard_check(vk_down);
		held_state[MENU_CONTROLS.LEFT] = keyboard_check(vk_left);
		held_state[MENU_CONTROLS.RIGHT] = keyboard_check(vk_right);
		held_state[MENU_CONTROLS.CONFIRM] = keyboard_check(vk_enter);
		held_state[MENU_CONTROLS.CANCEL] = keyboard_check(vk_backspace);
	}
}

/// @func  MenuItem(config)
/// @param config 
//         - {string} label
function MenuItem(_config) constructor {
	types = ds_list_create();
	ds_list_add(types, "item");
	label = _config.label;
	
	function destroy() {
		ds_list_destroy(types);
	}
}


/// @func  MenuSelectable(config)
/// @param config 
//         - {string}   label
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {boolean}  silent_on_confirm
function MenuSelectable(_config) : MenuItem(_config) constructor {
	ds_list_add(types, "selectable");
	on_confirm_func = asset_get_index(_config.on_confirm_func);
	on_confirm_args = _config.on_confirm_args;
	silent_on_confirm = _config.silent_on_confirm;
}


/// @func  MenuSpinner(config)
/// @param config 
//         - {string}   label
//         - {array}    values
//         - {integer}  init_index
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
//         - {boolean}  silent_on_change
function MenuSpinner(_config) : MenuSelectable(_config) constructor {
	ds_list_add(types, "spinner");
	values = _config.values;
	cur_index = clamp(_config.init_index, 0, array_length(values));
	on_change_func = asset_get_index(_config.on_change_func);
	on_change_args = _config.on_change_args;
	silent_on_change = _config.silent_on_change;
	
	function get_full_label() {
		return concat(label, ": ", values[cur_index]);
	}
}

/// @func  MenuKeyConfig(config)
/// @param config 
//         - {string}   label
//         - {array}    inital_keycode
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {boolean}  silent_on_confirm
function MenuKeyConfig(_config) : MenuItem(_config) constructor {
	ds_list_add(types, "keyconfig");
	on_confirm_func = asset_get_index(_config.on_confirm_func);
	on_confirm_args = _config.on_confirm_args;
	silent_on_confirm = _config.silent_on_confirm;
	keycode = _config.inital_keycode;
	discovery_mode = false;
	
	function get_full_label() {
		return discovery_mode
			?	concat(label, ": _")
			: concat(label, ": ", keycode_to_string(keycode));
	}
}