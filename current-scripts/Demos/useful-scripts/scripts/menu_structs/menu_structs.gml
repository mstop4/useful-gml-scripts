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
	control_handler = -1;
	
	for (var i=0; i< MENU_CONTROLS.MAX; i++) {
		pressed_state[i] = false;
		held_state[i] = false;
	}
	
	function poll_input() {
		if (control_handler != -1) {
			script_execute(control_handler);
		}
	}
}

function MenuItem(_label) constructor {
	label = _label;
}

function MenuSelectable(_label, _on_confirm) : MenuItem(_label) constructor {
	on_confirm = _on_confirm;
}