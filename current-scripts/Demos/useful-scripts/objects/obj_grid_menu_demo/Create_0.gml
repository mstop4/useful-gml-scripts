my_player = inst_control_manager.get_player(0);

menu = instance_create_layer(32, 64, layer, obj_grid_menu);
menu.grid_menu_init({
	player_controller: my_player,
	width: 3,
	height: 3,
	view_width: 2,
	view_height: 2,
	column_width: 80,
	font: fnt_demo,
	use_control_icons: false,
	keyboard_icons: [],
	gamepad_icons: [],
	control_icons_scale: 1,
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

menu.grid_menu_add_selectable(1, 1, { 
	label: "Qux",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Qux"],
	silent_on_confirm: false
});

menu.grid_menu_add_selectable(2, 0, { 
	label: "Boo",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Boo"],
	silent_on_confirm: false
});

menu.grid_menu_add_selectable(2, 1, { 
	label: "Far",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Far"],
	silent_on_confirm: false
});

menu.grid_menu_add_selectable(2, 2, { 
	label: "Qaz",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Qaz"],
	silent_on_confirm: false
});

menu.grid_menu_add_selectable(0, 2, { 
	label: "Bux",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Bux"],
	silent_on_confirm: false
});

menu.grid_menu_add_selectable(1, 2, { 
	label: "Huh",
	on_confirm_func: "menu_demo_on_confirm",
	on_confirm_args: ["Huh"],
	silent_on_confirm: false
});

menu.view_scroll_arrows_margin = 24;
menu.view_scroll_arrows_x = 100;
menu.view_scroll_arrows_y = 25;
