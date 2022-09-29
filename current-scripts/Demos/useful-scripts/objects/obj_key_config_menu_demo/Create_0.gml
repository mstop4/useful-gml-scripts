// Set up Control Manager
control_labels[CONTROLS.UP] = "Up";
control_labels[CONTROLS.DOWN] = "Down";
control_labels[CONTROLS.LEFT] = "Left";
control_labels[CONTROLS.RIGHT] = "Right";

control_binding[CONTROLS.UP] = ord("W");
control_binding[CONTROLS.DOWN] = ord("S");
control_binding[CONTROLS.LEFT] = ord("A");
control_binding[CONTROLS.RIGHT] = ord("D");

num_controls = 4;

control_manager = instance_create_layer(0, 0, layer, obj_control_manager);
var _player_index = control_manager.add_player();
my_player = control_manager.get_player(_player_index);

my_player.set_binding(CONTROL_TYPE.KEYBOARD_AND_MOUSE, CONTROL_SOURCE.KEYBOARD, CONTROLS.UP, 0, control_binding[CONTROLS.UP] );
my_player.set_binding(CONTROL_TYPE.KEYBOARD_AND_MOUSE, CONTROL_SOURCE.KEYBOARD, CONTROLS.DOWN, 0, control_binding[CONTROLS.DOWN] );
my_player.set_binding(CONTROL_TYPE.KEYBOARD_AND_MOUSE, CONTROL_SOURCE.KEYBOARD, CONTROLS.LEFT, 0, control_binding[CONTROLS.LEFT] );
my_player.set_binding(CONTROL_TYPE.KEYBOARD_AND_MOUSE, CONTROL_SOURCE.KEYBOARD, CONTROLS.RIGHT, 0, control_binding[CONTROLS.RIGHT] );

current_gamepad_index = control_manager.is_on_steam_deck()
	? control_manager.get_steam_deck_gamepad_index()
	: 0;
my_player.set_gamepad_slot(current_gamepad_index);

// Set key config menu
menu = instance_create_layer(32, 64, layer, obj_column_menu);
menu.column_menu_init({
	font: fnt_demo,
	view_height: 0,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
});

menu.column_menu_add_key_config({ 
	label: control_labels[CONTROLS.UP],
	inital_keycode: control_binding[CONTROLS.UP],
	on_change_func: -1,
	on_change_args: -1,
	on_confirm_func: -1,
	on_confirm_args: [-1],
	silent_on_confirm: false
});

menu.column_menu_add_key_config({ 
	label: control_labels[CONTROLS.DOWN],
	inital_keycode: control_binding[CONTROLS.DOWN],
	on_change_func: -1,
	on_change_args: -1,
	on_confirm_func: -1,
	on_confirm_args: [-1],
	silent_on_confirm: false
});

menu.column_menu_add_key_config({ 
	label: control_labels[CONTROLS.LEFT],
	inital_keycode: control_binding[CONTROLS.LEFT],
	on_change_func: -1,
	on_change_args: -1,
	on_confirm_func: -1,
	on_confirm_args: [-1],
	silent_on_confirm: false
});

menu.column_menu_add_key_config({ 
	label: control_labels[CONTROLS.RIGHT],
	inital_keycode: control_binding[CONTROLS.RIGHT],
	on_change_func: -1,
	on_change_args: -1,
	on_confirm_func: -1,
	on_confirm_args: [-1],
	silent_on_confirm: false
});

menu.label_width = 96;