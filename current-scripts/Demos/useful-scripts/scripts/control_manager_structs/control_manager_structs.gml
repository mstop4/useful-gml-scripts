enum CONTROL_TYPE {
	KEYBOARD,
	GAMEPAD,
	MAX
}

enum CONTROL_SOURCE {
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

function ControlManagerPlayer() constructor {
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
	
	// Mappable Controls
	for (var i=0; i<CONTROLS.MAX; i++) {
		keyboard_map[i] = new Binding(KEYBOARD_MAX_BINDINGS_PER_CONTROL, CONTROL_SOURCE.KEYBOARD);
		gamepad_map[i] = new Binding(GAMEPAD_MAX_BINDINGS_PER_CONTROL, CONTROL_SOURCE.GAMEPAD);
		touch_map[i] = new Binding(1, CONTROL_SOURCE.KEYBOARD);
		
		ctrl_held[i] = false;
		ctrl_pressed[i] = false;
		ctrl_released[i] = false;
	}

	ctrl_any_pressed = false;
	
	// Always tracked controls
	// Gamepad
	axis_held = new Vector2(0, 0);
	axis_pressed = new Vector2(0, 0);
	stick_input = new Vector2(0, 0);
	prev_stick_input = new Vector2(0, 0);
	
	for (var i=0; i<DPAD_DIRECTION.MAX; i++) {
		stick_dpad_held[i] = false;
		stick_dpad_pressed[i] = false;
		stick_dpad_released[i] = false;
	}
	
	// Touch
	
	function set_binding(
		_control_type,
		_control_source = CONTROL_TYPE.KEYBOARD,
		_control,
		_index,
		_value,
		_axis_direction = AXIS_DIRECTION.POSITIVE
	) {
		if (_control_type == CONTROL_TYPE.KEYBOARD) {
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
	
	function get_bindings(_control_type, _control) {
		if (_control_type == CONTROL_TYPE.KEYBOARD) {
			return keyboard_map[_control];
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			return gamepad_map[_control];
		} else {
			return noone;
		}
	}
	
	function get_control_state(_control, _control_state) {
		if (_control_state == CONTROL_STATE.HELD) {
			return ctrl_held[_control];
		} else if (_control_state == CONTROL_STATE.PRESSED) {
			return ctrl_pressed[_control];
		} else if (_control_state == CONTROL_STATE.RELEASED) {
			return ctrl_released[_control];
		} else {
			return noone;
		}
	}
	
	function process_input() {
		prev_stick_input.x = stick_input.x;
		prev_stick_input.y = stick_input.y;

		for (var i=0; i<CONTROLS.MAX; i++) {
			ctrl_held[i] = false;
			ctrl_pressed[i] = false;
			ctrl_released[i] = false;
		}

		ctrl_any_pressed = false;

		for (var i=0; i<DPAD_DIRECTION.MAX; i++) {
			stick_dpad_held[i] = false;
			stick_dpad_pressed[i] = false;
			stick_dpad_released[i] = false;
		}

		if (keyboard_enabled) {
			for (var i=0; i<CONTROLS.MAX; i++) {
				var _cur_values = keyboard_map[i].values;
				var _num_values = array_length(_cur_values);
				
				for (var j=0; j<_num_values; j++) {
					var _map_value = _cur_values[j];
					if (_map_value == -1) continue;

					if (keyboard_map[i].control_source == CONTROL_SOURCE.MOUSE) {
						ctrl_held[i] = ctrl_held[i] || mouse_check_button(_map_value);
						ctrl_pressed[i] = ctrl_pressed[i] || mouse_check_button_pressed(_map_value);
						ctrl_released[i] = ctrl_released[i] || mouse_check_button_released(_map_value);
					} else {
						ctrl_held[i] = ctrl_held[i] || keyboard_check(_map_value);
						ctrl_pressed[i] = ctrl_pressed[i] || keyboard_check_pressed(_map_value);
						ctrl_released[i] = ctrl_released[i] || keyboard_check_released(_map_value);
					}
				}
			}
	
			ctrl_any_pressed = keyboard_check_pressed(vk_anykey);
		}

		if (gamepad_enabled) {		
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
	
			for (var i=0; i<CONTROLS.MAX; i++) {
				var _cur_values = gamepad_map[i].values;
				var _num_values = array_length(_cur_values);
				
				for (var j=0; j<_num_values; j++) {
					var _map_value = _cur_values[j];
					if (_map_value == -1) continue;
				
					ctrl_held[i] = ctrl_held[i] || gamepad_button_check(gamepad_slot, _map_value);
					ctrl_pressed[i] = ctrl_pressed[i] || gamepad_button_check_pressed(gamepad_slot, _map_value);
					ctrl_released[i] = ctrl_released[i] || gamepad_button_check_released(gamepad_slot, _map_value);
				
					// Check Left-Stick-as-D-Pad values
					if (_map_value == gp_padd) {
						ctrl_held[i] = ctrl_held[i] || stick_dpad_held[DPAD_DIRECTION.DOWN];
						ctrl_pressed[i] = ctrl_held[i] || stick_dpad_pressed[DPAD_DIRECTION.DOWN];
						ctrl_released[i] = ctrl_held[i] || stick_dpad_released[DPAD_DIRECTION.DOWN];
					}
					if (_map_value == gp_padl) {
						ctrl_held[i] = ctrl_held[i] || stick_dpad_held[DPAD_DIRECTION.LEFT];
						ctrl_pressed[i] = ctrl_held[i] || stick_dpad_pressed[DPAD_DIRECTION.LEFT];
						ctrl_released[i] = ctrl_held[i] || stick_dpad_released[DPAD_DIRECTION.LEFT];
					}
					if (_map_value == gp_padr) {
						ctrl_held[i] = ctrl_held[i] || stick_dpad_held[DPAD_DIRECTION.RIGHT];
						ctrl_pressed[i] = ctrl_held[i] || stick_dpad_pressed[DPAD_DIRECTION.RIGHT];
						ctrl_released[i] = ctrl_held[i] || stick_dpad_released[DPAD_DIRECTION.RIGHT];
					}
					if (_map_value == gp_padu) {
						ctrl_held[i] = ctrl_held[i] || stick_dpad_held[DPAD_DIRECTION.UP];
						ctrl_pressed[i] = ctrl_held[i] || stick_dpad_pressed[DPAD_DIRECTION.UP];
						ctrl_released[i] = ctrl_held[i] || stick_dpad_released[DPAD_DIRECTION.UP];
					}
				}
			}
	
			// TODO: Cache button checks so they can be used with the above ctrl_* checks
			for (var i=gp_face1; i<gp_axisrv; i++) {
		    if (gamepad_button_check_pressed(gamepad_slot, i)) {
		      ctrl_any_pressed = true;
		      break;
		    }
		  }
		}

		axis_held.x = stick_dpad_held[DPAD_DIRECTION.RIGHT] - stick_dpad_held[DPAD_DIRECTION.LEFT]; 
		axis_held.y = stick_dpad_held[DPAD_DIRECTION.DOWN] - stick_dpad_held[DPAD_DIRECTION.UP]; 
		axis_pressed.x = stick_dpad_pressed[DPAD_DIRECTION.RIGHT] - stick_dpad_pressed[DPAD_DIRECTION.LEFT]; 
		axis_pressed.y = stick_dpad_pressed[DPAD_DIRECTION.DOWN] - stick_dpad_pressed[DPAD_DIRECTION.UP];
	}

	function clear_all_input() {
		for (var i=0; i<CONTROLS.MAX; i++) {
			ctrl_held[i] = false;
			ctrl_pressed[i] = false;
			ctrl_released[i] = false;
		}
	
		ctrl_any_pressed = false;
		
		for (var i=0; i<DPAD_DIRECTION.MAX; i++) {
			stick_dpad_held[i] = false;
			stick_dpad_pressed[i] = false;
			stick_dpad_released[i] = false;
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