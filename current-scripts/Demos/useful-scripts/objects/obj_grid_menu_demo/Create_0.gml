my_player = inst_control_manager.get_player(0);

menu = instance_create_layer(32, 64, layer, obj_grid_menu);
menu.grid_menu_init({
	player_controller: my_player,
	width: 2,
	height: 3,
	view_width: 0,
	view_height: 0,
	column_width: 80,
	font: fnt_demo,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
});

menu.grid_menu_add_selectable(0, 0, { 
	label: "Foo",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Foo"],
	silent_on_confirm: false
});

//         - {string}   label
//         - {array}    values
//         - {integer}  init_index
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
//         - {boolean}  silent_on_change

menu.grid_menu_add_selectable(0, 1, { 
	label: "Bar",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Bar"],
	silent_on_confirm: false
});

menu.grid_menu_add_selectable(1, 0, { 
	label: "Baz",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Baz"],
	silent_on_confirm: false
});

menu.grid_menu_add_key_config(1, 1, { 
	label: "Qux",
	control: CONTROLS.TEST,
	initial_kbm_bindings: duplicate_array(my_player.get_bindings(CONTROL_TYPE.KEYBOARD_AND_MOUSE, CONTROLS.TEST).values),
	initial_gamepad_bindings: duplicate_array(my_player.get_bindings(CONTROL_TYPE.GAMEPAD, CONTROLS.TEST).values),
	on_change_func: -1,
	on_change_args: [-1],
	on_confirm_func: -1,
	on_confirm_args: [-1],
	silent_on_confirm: false,
	silent_on_change: false
});