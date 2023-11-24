// Feather disable GM1029
// Feather disable GM1009
// Feather disable GM1041
// Feather disable GM1028
enum CONTROL_TYPE {
	NONE,
	KEYBOARD_AND_MOUSE,
	GAMEPAD,
	MAX
}

enum CONTROL_SOURCE {
	NONE,
	KEYBOARD,
	MOUSE,
	GAMEPAD,
	MAX
}

enum CONTROL_STATE {
	HELD,
	PRESSED,
	RELEASED,
	MAX
}

enum DPAD_DIRECTION {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	MAX
}

enum AXIS_DIRECTION {
	POSITIVE = 1,
	NEGATIVE = -1,
}

function Binding(_num_values, _control_source) constructor {
	values = array_create(_num_values, -1);
	control_source = _control_source;
	axis_drection = AXIS_DIRECTION.POSITIVE;
}

/// @param {Id.Instance} _control_manager
function ControlManagerPlayer(_control_manager) constructor {
	control_manager = _control_manager;
	keyboard_enabled = true;
	gamepad_enabled = true;
	touch_enabled = true;
	tilt_enabled = true;
	gamepad_slot = 0;
	gamepad_stick_enabled = true;
	gamepad_stick_to_dpad = true;
	stick_deadzone = 0.1;
	stick_threshold = 0.5;
	max_touches = 8;

	keyboard_map = [];
	gamepad_map = [];
	touch_map = [];
	ctrl_held = [];
	ctrl_pressed = [];
	ctrl_released = [];
	
	// Mappable Controls
	for (var _i=0; _i<CONTROLS.MAX; _i++) {
		keyboard_map[_i] = new Binding(KEYBOARD_MAX_BINDINGS_PER_CONTROL, CONTROL_SOURCE.KEYBOARD);
		gamepad_map[_i] = new Binding(GAMEPAD_MAX_BINDINGS_PER_CONTROL, CONTROL_SOURCE.GAMEPAD);
		touch_map[_i] = new Binding(1, CONTROL_SOURCE.KEYBOARD);
		
		ctrl_held[_i] = false;
		ctrl_pressed[_i] = false;
		ctrl_released[_i] = false;
	}

	ctrl_any_pressed = {
		control_type: CONTROL_TYPE.NONE,
		control_source: CONTROL_SOURCE.NONE,
		control_pressed: -1
	};
	
	// Always tracked controls
	// Gamepad
	axis_held = new Vector2(0, 0);
	axis_pressed = new Vector2(0, 0);
	stick_input = new Vector2(0, 0);
	prev_stick_input = new Vector2(0, 0);
	
	for (var _i=0; _i<DPAD_DIRECTION.MAX; _i++) {
		stick_dpad_held[_i] = false;
		stick_dpad_pressed[_i] = false;
		stick_dpad_released[_i] = false;
	}
	
	// Touch
	
	/// @func set_binding
	/// @param {real} _control_type CONTROL_TYPE
	/// @param {real} _control_source CONTROL_SOURCE
	/// @param {real} _control CONTROL
	/// @param {real} _index
	/// @param {real} _value
	/// @param {real} _axis_direction AXIS_DIRECTION
	function set_binding(
		_control_type,
		_control_source,
		_control,
		_index,
		_value,
		_axis_direction = AXIS_DIRECTION.POSITIVE
	) {
		if (_control_type == CONTROL_TYPE.KEYBOARD_AND_MOUSE) {
			if (_index < 0 || _index >= array_length(keyboard_map[_control].values)) {
				print("ControlManagerPlayer.set_binding - index ", _index, " out of bounds");
				return;
			}
			keyboard_map[_control].values[_index] = _value;
			keyboard_map[_control].control_source = _control_source;
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			if (_index < 0 || _index >= array_length(gamepad_map[_control].values)) {
				print("ControlManagerPlayer.set_binding - index ", _index, " out of bounds");
				return;
			}
			gamepad_map[_control].values[_index] = _value;
			gamepad_map[_control].axis_drection = _axis_direction;
		}
	}
	
	function remove_binding(_control_type, _control, _index) {
		if (_control_type == CONTROL_TYPE.KEYBOARD_AND_MOUSE) {
			if (_index < 0 || _index >= array_length(keyboard_map[_control].values)) {
				print("ControlManagerPlayer.remove_binding - index ", _index, " out of bounds");
				return;
			}
			keyboard_map[_control].values[_index] = -1;
			keyboard_map[_control].control_source = -1;
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			if (_index < 0 || _index >= array_length(gamepad_map[_control].values)) {
				print("ControlManagerPlayer.remove_binding - index ", _index, " out of bounds");
				return;
			}
			gamepad_map[_control].values[_index] = -1;
			gamepad_map[_control].axis_drection = 0;
		}
	}
	
	function reset_all_bindings() {
		for (var _i=0; _i<CONTROLS.MAX; _i++) {
			keyboard_map[_i] = new Binding(KEYBOARD_MAX_BINDINGS_PER_CONTROL, CONTROL_SOURCE.KEYBOARD);
			gamepad_map[_i] = new Binding(GAMEPAD_MAX_BINDINGS_PER_CONTROL, CONTROL_SOURCE.GAMEPAD);
			touch_map[_i] = new Binding(1, CONTROL_SOURCE.KEYBOARD);
		}
	}
	
	function get_bindings(_control_type, _control) {
		if (_control_type == CONTROL_TYPE.KEYBOARD_AND_MOUSE) {
			return keyboard_map[_control];
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			return gamepad_map[_control];
		} else {
			// Feather disable once GM1035
			return noone;
		}
	}
	
	function get_gamepad_slot() {
		return gamepad_slot;
	}
	
	function set_gamepad_slot(_index) {
		gamepad_slot = _index;
		clear_all_input();
	}
	
	function get_control_state(_control, _control_state) {
		if (_control_state == CONTROL_STATE.HELD) {
			return ctrl_held[_control];
		} else if (_control_state == CONTROL_STATE.PRESSED) {
			return ctrl_pressed[_control];
		} else if (_control_state == CONTROL_STATE.RELEASED) {
			return ctrl_released[_control];
		} else {
			// Feather disable once GM1035
			return noone;
		}
	}
	
	function process_input() {
		prev_stick_input.x = stick_input.x;
		prev_stick_input.y = stick_input.y;

		for (var _i=0; _i<CONTROLS.MAX; _i++) {
			ctrl_held[_i] = false;
			ctrl_pressed[_i] = false;
			ctrl_released[_i] = false;
		}

		ctrl_any_pressed.control_type = CONTROL_TYPE.NONE;
		ctrl_any_pressed.control_source = CONTROL_SOURCE.NONE;
		ctrl_any_pressed.control_pressed = -1;

		for (var _i=0; _i<DPAD_DIRECTION.MAX; _i++) {
			stick_dpad_held[_i] = false;
			stick_dpad_pressed[_i] = false;
			stick_dpad_released[_i] = false;
		}

		if (keyboard_enabled) {
			for (var _i=0; _i<CONTROLS.MAX; _i++) {
				var _cur_values = keyboard_map[_i].values;
				var _num_values = array_length(_cur_values);
				
				for (var _j=0; _j<_num_values; _j++) {
					var _map_value = _cur_values[_j];
					if (_map_value == -1) continue;

					if (keyboard_map[_i].control_source == CONTROL_SOURCE.MOUSE) {
						ctrl_held[_i] = ctrl_held[_i] || mouse_check_button(_map_value);
						ctrl_pressed[_i] = ctrl_pressed[_i] || mouse_check_button_pressed(_map_value);
						ctrl_released[_i] = ctrl_released[_i] || mouse_check_button_released(_map_value);
					} else {
						ctrl_held[_i] = ctrl_held[_i] || keyboard_check(_map_value);
						ctrl_pressed[_i] = ctrl_pressed[_i] || keyboard_check_pressed(_map_value);
						ctrl_released[_i] = ctrl_released[_i] || keyboard_check_released(_map_value);
					}
				}
			}
	
			// Any pressed
			if (keyboard_check_pressed(vk_anykey)) {
				ctrl_any_pressed.control_type = CONTROL_TYPE.KEYBOARD_AND_MOUSE;
				ctrl_any_pressed.control_source = CONTROL_SOURCE.KEYBOARD;
				ctrl_any_pressed.control_pressed = keyboard_key;
			}
		}

		if (gamepad_enabled && !control_manager.gamepad_discovery_mode) {		
			// Process Left Stick
			if (gamepad_stick_enabled) {
				stick_input.x = gamepad_axis_value(gamepad_slot, gp_axislh);
				stick_input.y = gamepad_axis_value(gamepad_slot, gp_axislv);
		
				if (abs(stick_input.x) < stick_deadzone) stick_input.x = 0;
				if (abs(stick_input.y) < stick_deadzone) stick_input.y = 0;
		
				// Process Left Stick as D-Pad
				if (gamepad_stick_to_dpad) {
					if (abs(stick_input.y) > stick_threshold) {
						if (stick_input.y < 0) { // Up
							if (stick_input.y <= -stick_threshold) {
								stick_dpad_held[DPAD_DIRECTION.UP] = true;
								if (prev_stick_input.y > -stick_threshold) {
									stick_dpad_pressed[DPAD_DIRECTION.UP] = true;
								}
							} else if (prev_stick_input.y <= -stick_threshold) {
								stick_dpad_released[DPAD_DIRECTION.UP] = true;
							}
						} else if (stick_input.y > 0) { // Down
							if (stick_input.y >= stick_threshold) {
								stick_dpad_held[DPAD_DIRECTION.DOWN] = true;
								if (prev_stick_input.y < stick_threshold) {
									stick_dpad_pressed[DPAD_DIRECTION.DOWN] = true;
								}
							} else if (prev_stick_input.y > stick_threshold) {
								stick_dpad_released[DPAD_DIRECTION.DOWN] = true;
							}
						} 
					}

					if (abs(stick_input.x) > stick_threshold) {
						if (stick_input.x < 0) { // Left
							if (stick_input.x <= -stick_threshold) {
								stick_dpad_held[DPAD_DIRECTION.LEFT] = true;
								if (prev_stick_input.x > -stick_threshold) {
									stick_dpad_pressed[DPAD_DIRECTION.LEFT] = true;
								}
							} else if (prev_stick_input.x <= -stick_threshold) {
								stick_dpad_released[DPAD_DIRECTION.LEFT] = true;
							}
						} else if (stick_input.x > 0) { // Right
							if (stick_input.x >= stick_threshold) {
								stick_dpad_held[DPAD_DIRECTION.RIGHT] = true;
								if (prev_stick_input.x < stick_threshold) {
									stick_dpad_pressed[DPAD_DIRECTION.RIGHT] = true;
								}
							} else if (prev_stick_input.x > stick_threshold) {
								stick_dpad_released[DPAD_DIRECTION.RIGHT] = true;
							}
						} 
					}
				}
			}
	
			for (var _i=0; _i<CONTROLS.MAX; _i++) {
				var _cur_values = gamepad_map[_i].values;
				var _num_values = array_length(_cur_values);
				
				for (var _j=0; _j<_num_values; _j++) {
					var _map_value = _cur_values[_j];
					if (_map_value == -1) continue;
				
					ctrl_held[_i] = ctrl_held[_i] || gamepad_button_check(gamepad_slot, _map_value);
					ctrl_pressed[_i] = ctrl_pressed[_i] || gamepad_button_check_pressed(gamepad_slot, _map_value);
					ctrl_released[_i] = ctrl_released[_i] || gamepad_button_check_released(gamepad_slot, _map_value);
				
					// Check Left-Stick-as-D-Pad values
					if (_map_value == gp_padd) {
						ctrl_held[_i] = ctrl_held[_i] || stick_dpad_held[DPAD_DIRECTION.DOWN];
						ctrl_pressed[_i] = ctrl_pressed[_i] || stick_dpad_pressed[DPAD_DIRECTION.DOWN];
						ctrl_released[_i] = ctrl_released[_i] || stick_dpad_released[DPAD_DIRECTION.DOWN];
					}
					if (_map_value == gp_padl) {
						ctrl_held[_i] = ctrl_held[_i] || stick_dpad_held[DPAD_DIRECTION.LEFT];
						ctrl_pressed[_i] = ctrl_pressed[_i] || stick_dpad_pressed[DPAD_DIRECTION.LEFT];
						ctrl_released[_i] = ctrl_released[_i] || stick_dpad_released[DPAD_DIRECTION.LEFT];
					}
					if (_map_value == gp_padr) {
						ctrl_held[_i] = ctrl_held[_i] || stick_dpad_held[DPAD_DIRECTION.RIGHT];
						ctrl_pressed[_i] = ctrl_pressed[_i] || stick_dpad_pressed[DPAD_DIRECTION.RIGHT];
						ctrl_released[_i] = ctrl_released[_i] || stick_dpad_released[DPAD_DIRECTION.RIGHT];
					}
					if (_map_value == gp_padu) {
						ctrl_held[_i] = ctrl_held[_i] || stick_dpad_held[DPAD_DIRECTION.UP];
						ctrl_pressed[_i] = ctrl_pressed[_i] || stick_dpad_pressed[DPAD_DIRECTION.UP];
						ctrl_released[_i] = ctrl_released[_i] || stick_dpad_released[DPAD_DIRECTION.UP];
					}
				}
			}
	
			// Any pressed
			// TODO: Cache button checks so they can be used with the above ctrl_* checks
			for (var _i=gp_face1; _i<=gp_padr; _i++) {
		    if (gamepad_button_check_pressed(gamepad_slot, _i)) {
					ctrl_any_pressed.control_type = CONTROL_TYPE.GAMEPAD;
					ctrl_any_pressed.control_source = CONTROL_SOURCE.GAMEPAD;
					ctrl_any_pressed.control_pressed = _i;
		      break;
		    }
		  }
			
			axis_held.x = stick_dpad_held[DPAD_DIRECTION.RIGHT] - stick_dpad_held[DPAD_DIRECTION.LEFT]; 
			axis_held.y = stick_dpad_held[DPAD_DIRECTION.DOWN] - stick_dpad_held[DPAD_DIRECTION.UP]; 
			axis_pressed.x = stick_dpad_pressed[DPAD_DIRECTION.RIGHT] - stick_dpad_pressed[DPAD_DIRECTION.LEFT]; 
			axis_pressed.y = stick_dpad_pressed[DPAD_DIRECTION.DOWN] - stick_dpad_pressed[DPAD_DIRECTION.UP];
		}
	}

	function clear_all_input() {
		for (var _i=0; _i<CONTROLS.MAX; _i++) {
			ctrl_held[_i] = false;
			ctrl_pressed[_i] = false;
			ctrl_released[_i] = false;
		}
	
		ctrl_any_pressed.control_type = CONTROL_TYPE.NONE;
		ctrl_any_pressed.control_source = CONTROL_SOURCE.NONE;
		ctrl_any_pressed.control_pressed = -1;
		
		for (var _i=0; _i<DPAD_DIRECTION.MAX; _i++) {
			stick_dpad_held[_i] = false;
			stick_dpad_pressed[_i] = false;
			stick_dpad_released[_i] = false;
		}
		
		axis_held.x = 0;
		axis_held.y = 0;
		axis_pressed.x = 0;
		axis_pressed.y = 0;
		stick_input.x = 0
		stick_input.y = 0;
		prev_stick_input.x = 0;
		prev_stick_input.y = 0;
	}
}