my_player = inst_control_manager.get_player(0);

submenu[0] = instance_create_layer(0, 0, layer, obj_column_menu);
submenu[0].column_menu_init({
	player_controller: my_player,
	font: fnt_demo,
	view_height: 0,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
});

submenu[0].column_menu_add_selectable({ 
	label: "Cat",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Meow"],
	silent_on_confirm: false
});

submenu[0].column_menu_add_selectable({ 
	label: "Dog",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Woof"],
	silent_on_confirm: false
});

submenu[0].column_menu_add_spinner({ 
	label: "Rating",
	values: [0, 1, 2, 3, 4, 5],
	init_index: 0,
	on_confirm_func: -1,
	on_confirm_args: [],
	on_change_func: -1,
	on_change_args: [],
	silent_on_confirm: false,
	silent_on_change: false
});
submenu[0].label_width = 96;

submenu[1] = instance_create_layer(0, 0, layer, obj_column_menu);
submenu[1].column_menu_init({
	player_controller: inst_control_manager.get_player(0),
	font: fnt_demo,
	view_height: 0,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
});

submenu[1].column_menu_add_key_config({ 
	label: "Broccoli",
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

submenu[1].column_menu_add_selectable({ 
	label: "Tomato",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Splat"],
	silent_on_confirm: false
});

submenu[1].column_menu_add_selectable({ 
	label: "Potato",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Mash"],
	silent_on_confirm: false
});

submenu[1].column_menu_add_selectable({ 
	label: "Carrot",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Crunch"],
	silent_on_confirm: false
});

// -----

main_menu = instance_create_layer(32, 64, layer, obj_nested_menu);
main_menu.nested_menu_init({
	player_controller: inst_control_manager.get_player(0),
	font: fnt_demo,
	view_height: 0,
	column_width: 192,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
});

main_menu.nested_menu_add_submenu({
	submenu: submenu[0],
	label: "Animals",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Foo"],
	silent_on_confirm: false
});

main_menu.nested_menu_add_submenu({
	submenu: submenu[1],
	label: "Vegetables",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Bar"],
	silent_on_confirm: false
});