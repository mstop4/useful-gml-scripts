enum CONTROLS {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	A,
	B,
	X,
	Y,
	MAX
}

enum CONTROL_TYPE {
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
		keyboard_map[i] = -1;
		// keyboard_control_source[i] = CONTROL_TYPE.KEYBOARD;
		gamepad_map[i] = -1;
		touch_map[i] = -1;
		
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
	
	// Touch
	
	
	function set_control_map(_control_type, _control_source, _control, _value) {
		if (_control_type == CONTROL_TYPE.KEYBOARD) {
			keyboard_control_source[_control] = _control_source;
			keyboard_map[_control] = _value;
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			gamepad_map[_control] = _value;
		}
	}
	
	function get_control_map(_control_type, _control) {
		if (_control_type == CONTROL_TYPE.KEYBOARD) {
			return {
				control_source: keyboard_control_source[_control],
				control: keyboard_map[_control]
			};
		} else if (_control_type == CONTROL_TYPE.GAMEPAD) {
			return {
				control_source: _control_type,
				control: gamepad_map[_control]
			}; 
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
	
	function process_input(_control_manager) {
		prev_stick_input.x = stick_input.x;
		prev_stick_input.y = stick_input.y;

		for (var i=0; i<CONTROLS.MAX; i++) {
			ctrl_held[i] = false;
			ctrl_pressed[i] = false;
			ctrl_released[i] = false;
		}

		ctrl_any_pressed = false;

		if (keyboard_enabled) {
			for (var i=0; i<CONTROLS.MAX; i++) {
				if (keyboard_control_source[i] == CONTROL_TYPE.MOUSE) {
					ctrl_held[i] = mouse_check_button(keyboard_map[i]);
					ctrl_pressed[i] = mouse_check_button_pressed(keyboard_map[i]);
					ctrl_released[i] = mouse_check_button_released(keyboard_map[i]);
				} else {
					ctrl_held[i] = keyboard_check(keyboard_map[i]);
					ctrl_pressed[i] = keyboard_check_pressed(keyboard_map[i]);
					ctrl_released[i] = keyboard_check_released(keyboard_map[i]);
				}
			}
	
			ctrl_any_pressed = keyboard_check_pressed(vk_anykey);
		}

		if (gamepad_enabled) {
			if (gamepad_stick_enabled) {
				stick_input.x = gamepad_axis_value(gamepad_slot, gp_axislh);
				stick_input.y = gamepad_axis_value(gamepad_slot, gp_axislv);
		
				if (abs(stick_input.x) < stick_deadzone) stick_input.x = 0;
				if (abs(stick_input.y) < stick_deadzone) stick_input.y = 0;
		
				if (gamepad_stick_to_dpad) {
					if (abs(stick_input.y) > stick_threshold) {
						if (stick_input.y < 0) { // Up
							if (stick_input.y <= -stick_threshold) {
								ctrl_held[CONTROLS.UP] = true;
								if (prev_stick_input.y > -stick_threshold) {
									ctrl_pressed[CONTROLS.UP] = true;
								}
							} else if (prev_stick_input.y <= -stick_threshold) {
								ctrl_released[CONTROLS.UP] = true;
							}
						} else if (stick_input.y > 0) { // Down
							if (stick_input.y >= stick_threshold) {
								ctrl_held[CONTROLS.DOWN] = true;
								if (prev_stick_input.y < stick_threshold) {
									ctrl_pressed[CONTROLS.DOWN] = true;
								}
							} else if (prev_stick_input.y > stick_threshold) {
								ctrl_released[CONTROLS.DOWN] = true;
							}
						} 
					}

					if (abs(stick_input.x) > stick_threshold) {
						if (stick_input.x < 0) { // Left
							if (stick_input.x <= -stick_threshold) {
								ctrl_held[CONTROLS.LEFT] = true;
								if (prev_stick_input.x > -stick_threshold) {
									ctrl_pressed[CONTROLS.LEFT] = true;
								}
							} else if (prev_stick_input.x <= -stick_threshold) {
								ctrl_released[CONTROLS.LEFT] = true;
							}
						} else if (stick_input.x > 0) { // Right
							if (stick_input.x >= stick_threshold) {
								ctrl_held[CONTROLS.RIGHT] = true;
								if (prev_stick_input.x < stick_threshold) {
									ctrl_pressed[CONTROLS.RIGHT] = true;
								}
							} else if (prev_stick_input.x > stick_threshold) {
								ctrl_released[CONTROLS.RIGHT] = true;
							}
						} 
					}
				}
			}
	
			for (var i=0; i<CONTROLS.MAX; i++) {
				ctrl_held[i] = gamepad_button_check(gamepad_slot, gamepad_map[i]) || ctrl_held[i];
				ctrl_pressed[i] = gamepad_button_check_pressed(gamepad_slot, gamepad_map[i]) || ctrl_pressed[i];
				ctrl_released[i] = gamepad_button_check_released(gamepad_slot, gamepad_map[i]) || ctrl_released[i];
			}
	
			for (var i=gp_face1; i<gp_axisrv; i++) {
		    if (gamepad_button_check_pressed(gamepad_slot, i)) {
		      ctrl_any_pressed = true;
		      break;
		    }
		  }
		}

		axis_held.x = ctrl_held[CONTROLS.RIGHT] - ctrl_held[CONTROLS.LEFT]; 
		axis_held.y = ctrl_held[CONTROLS.DOWN] - ctrl_held[CONTROLS.UP]; 
		axis_pressed.x = ctrl_pressed[CONTROLS.RIGHT] - ctrl_pressed[CONTROLS.LEFT]; 
		axis_pressed.y = ctrl_pressed[CONTROLS.DOWN] - ctrl_pressed[CONTROLS.UP];
	}

	function clear_all_input() {
		for (var i=0; i<CONTROLS.MAX; i++) {
			ctrl_held[i] = false;
			ctrl_pressed[i] = false;
			ctrl_released[i] = false;
		}
	
		ctrl_any_pressed = false;
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