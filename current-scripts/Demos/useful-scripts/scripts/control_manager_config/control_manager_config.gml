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
	MAX
}

global.locked_keyboard_controls = [ vk_escape, vk_backspace ];
global.locked_gamepad_controls = [ gp_start ];

#macro KEYBOARD_MAX_BINDINGS_PER_CONTROL 2
#macro GAMEPAD_MAX_BINDINGS_PER_CONTROL 2