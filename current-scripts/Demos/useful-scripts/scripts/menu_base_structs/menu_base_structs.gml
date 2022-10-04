enum MENU_CONTROLS {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CONFIRM,
	CANCEL,
	MAX
}

function MenuControlState(_player_inst) constructor {
	pressed_state = [];
	held_state = [];
	player_inst = _player_inst;
	
	for (var i=0; i< MENU_CONTROLS.MAX; i++) {
		pressed_state[i] = false;
		held_state[i] = false;
	}
	
	function poll_input() {
		pressed_state[MENU_CONTROLS.UP] = player_inst.get_control_state(CONTROLS.UP, CONTROL_STATE.PRESSED);
		pressed_state[MENU_CONTROLS.DOWN] = player_inst.get_control_state(CONTROLS.DOWN, CONTROL_STATE.PRESSED);
		pressed_state[MENU_CONTROLS.LEFT] = player_inst.get_control_state(CONTROLS.LEFT, CONTROL_STATE.PRESSED);
		pressed_state[MENU_CONTROLS.RIGHT] = player_inst.get_control_state(CONTROLS.RIGHT, CONTROL_STATE.PRESSED);
		pressed_state[MENU_CONTROLS.CONFIRM] = player_inst.get_control_state(CONTROLS.MENU_CONFIRM, CONTROL_STATE.PRESSED);
		pressed_state[MENU_CONTROLS.CANCEL] = player_inst.get_control_state(CONTROLS.MENU_CANCEL, CONTROL_STATE.PRESSED);
	
		held_state[MENU_CONTROLS.UP] = player_inst.get_control_state(CONTROLS.UP, CONTROL_STATE.HELD);
		held_state[MENU_CONTROLS.DOWN] = player_inst.get_control_state(CONTROLS.DOWN, CONTROL_STATE.HELD);
		held_state[MENU_CONTROLS.LEFT] = player_inst.get_control_state(CONTROLS.LEFT, CONTROL_STATE.HELD);
		held_state[MENU_CONTROLS.RIGHT] = player_inst.get_control_state(CONTROLS.RIGHT, CONTROL_STATE.HELD);
		held_state[MENU_CONTROLS.CONFIRM] = player_inst.get_control_state(CONTROLS.MENU_CONFIRM, CONTROL_STATE.HELD);
		held_state[MENU_CONTROLS.CANCEL] = player_inst.get_control_state(CONTROLS.MENU_CANCEL, CONTROL_STATE.HELD);
	}
	
	function control_any_pressed() {
		return player_inst.ctrl_any_pressed;
	}
}

/// @func  MenuItem(config)
/// @param config 
//         - {string} label
function MenuItem(_config) constructor {
	types = ds_list_create();
	ds_list_add(types, "item");
	label = _config.label;
	parent_menu = noone;
	
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

/// @func  MenuSpinnerBase(config)
/// @param config 
//         - {string}   label
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
//         - {boolean}  silent_on_change
function MenuSpinnerBase(_config) : MenuItem(_config) constructor {
	ds_list_add(types, "spinner");
	on_confirm_func = asset_get_index(_config.on_confirm_func);
	on_confirm_args = _config.on_confirm_args;
	silent_on_confirm = _config.silent_on_confirm;
	on_change_func = asset_get_index(_config.on_change_func);
	on_change_args = _config.on_change_args;
	silent_on_change = _config.silent_on_change;
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
function MenuSpinner(_config) : MenuSpinnerBase(_config) constructor {
	values = _config.values;
	cur_index = clamp(_config.init_index, 0, array_length(values));
	
	function get_full_label() {
		return concat(label, ": ", values[cur_index]);
	}
	
	function get_value() {
		return values[cur_index];
	}
}

/// @func  MenuKeyConfig(config)
/// @param config 
//         - {string}   label
//         - {array}    initial_kbm_bindings
//         - {array}    initial_gamepad_bindings
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
function MenuKeyConfig(_config) : MenuItem(_config) constructor {
	ds_list_add(types, "keyconfig");
	on_change_func = asset_get_index(_config.on_change_func);
	on_change_args = _config.on_change_args;
	silent_on_confirm = _config.silent_on_confirm;
	kbm_bindings = _config.initial_kbm_bindings;
	gamepad_bindings = _config.initial_gamepad_bindings;
	current_binding_index = 0;
	discovery_mode = false;
	discovery_binding_info = false;
	
	function get_binding_info() {
		if (current_binding_index < 0) return false;
		if (current_binding_index >= GAMEPAD_MAX_BINDINGS_PER_CONTROL + KEYBOARD_MAX_BINDINGS_PER_CONTROL) return false;
		
		if (current_binding_index < KEYBOARD_MAX_BINDINGS_PER_CONTROL) {
			return {
				control_type: CONTROL_TYPE.KEYBOARD_AND_MOUSE,
				control_index: current_binding_index,
			}
		} else {
			return {
				control_type: CONTROL_TYPE.GAMEPAD,
				control_index: current_binding_index - KEYBOARD_MAX_BINDINGS_PER_CONTROL,
			}
		}
	}
	
	function get_full_label(_control_type, _index) {
		return concat(label, ":", get_value(_control_type, _index));
	}
	
	function get_value(_control_type, _index) {
		if (_control_type == CONTROL_TYPE.KEYBOARD_AND_MOUSE) {
			if (_index >= array_length(kbm_bindings)) {
				return "-";
			} else if (discovery_binding_info
				&& discovery_binding_info.control_type == _control_type
				&& discovery_binding_info.control_index == _index) {
				return "_";
			} else {
				return keycode_to_string(kbm_bindings[_index]);
			}
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			if (_index >= array_length(gamepad_bindings)) {
				return "-";
			} else if (discovery_binding_info
				&& discovery_binding_info.control_type == _control_type
				&& discovery_binding_info.control_index == _index) {
				return "_";
			} else {
				return string(gamepad_bindings[_index]);
			}
		} else {
			return "???";
		}
	}
}