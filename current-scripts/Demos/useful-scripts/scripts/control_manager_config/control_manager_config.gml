enum CONTROLS {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	SHOOT,
	JUMP,
	INTERACT,
	ITEM,
	EXIT,
	MENU_UP,
	MENU_DOWN,
	MENU_LEFT,
	MENU_RIGHT,
	MENU_CONFIRM,
	MENU_CANCEL,
	DELETE_BINDING,
	MAX
}

global.disallowed_keyboard_controls = [ vk_escape, vk_backspace ];
global.disallowed_gamepad_controls = [ gp_start ];

#macro KEYBOARD_MAX_BINDINGS_PER_CONTROL 2
#macro GAMEPAD_MAX_BINDINGS_PER_CONTROL 2