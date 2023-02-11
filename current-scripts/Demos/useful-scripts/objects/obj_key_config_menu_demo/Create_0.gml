// Set up Control Manager
control_labels[CONTROLS.UP] = "Up";
control_labels[CONTROLS.DOWN] = "Down";
control_labels[CONTROLS.LEFT] = "Left";
control_labels[CONTROLS.RIGHT] = "Right";

num_controls = 4;
my_player = inst_control_manager.get_player(0);

current_gamepad_index = inst_control_manager.is_on_steam_deck()
	? inst_control_manager.get_steam_deck_gamepad_index()
	: 0;
my_player.set_gamepad_slot(current_gamepad_index);

// Set key config menu
menu = instance_create_layer(32, 96, layer, obj_column_menu);
menu.column_menu_init({
	player_controller: my_player,
	label_font: fnt_demo,
	value_font: fnt_menu_value,
	view_height: 0,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
	use_control_icons: true,
	keyboard_icons: [spr_keyboard_icons],
	gamepad_icons: [spr_xbox_series_gamepad_icons],
	control_icons_scale: 0.3
});

for (var i=CONTROLS.UP; i<=CONTROLS.RIGHT; i++) {
	menu.column_menu_add_key_config({ 
		label: control_labels[i],
		control: i,
		initial_kbm_bindings: duplicate_array(my_player.get_bindings(CONTROL_TYPE.KEYBOARD_AND_MOUSE, i).values),
		initial_gamepad_bindings: duplicate_array(my_player.get_bindings(CONTROL_TYPE.GAMEPAD, i).values),
		on_change_func: -1,
		on_change_args: [-1],
		on_confirm_func: -1,
		on_confirm_args: [-1],
		silent_on_confirm: false,
		silent_on_change: false
	});
}

menu.column_menu_add_key_config({ 
	label: "Cancel",
	control: CONTROLS.MENU_CANCEL,
	initial_kbm_bindings: duplicate_array(my_player.get_bindings(CONTROL_TYPE.KEYBOARD_AND_MOUSE, CONTROLS.MENU_CANCEL).values),
	initial_gamepad_bindings: duplicate_array(my_player.get_bindings(CONTROL_TYPE.GAMEPAD, CONTROLS.MENU_CANCEL).values),
	on_change_func: -1,
	on_change_args: [-1],
	on_confirm_func: -1,
	on_confirm_args: [-1],
	silent_on_confirm: false,
	silent_on_change: false
});

menu.label_width = 96;
menu.binding_spacing = 160;