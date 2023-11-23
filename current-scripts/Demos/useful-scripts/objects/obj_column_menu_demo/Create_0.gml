my_player = inst_control_manager.get_player(0);

menu = instance_create_layer(32, 64, layer, obj_column_menu);
menu.column_menu_init({
	player_controller: my_player,
	label_font: fnt_demo,
	value_font: fnt_menu_value,
	view_height: 4,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: snd_menu_move,
	cursor_confirm_sfx: -1,
	use_control_icons: false,
	keyboard_icons: [],
	gamepad_icons: [],
	control_icons_scale: 1,
});

menu.label_width = 96;

menu.column_menu_add_selectable({ 
	label: "Item 1",
	on_confirm_func: menu_demo_on_selectable_confirm,
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

menu.column_menu_add_spinner({ 
	label: "Item 2",
	values: ["A", 1, "B", 2, "C", 3],
	init_index: 0,
	on_confirm_func: -1,
	on_confirm_args: [],
	on_change_func: -1,
	on_change_args: [],
	silent_on_confirm: false,
	silent_on_change: false
});

menu.column_menu_add_selectable({ 
	label: "Item 3",
	on_confirm_func: menu_demo_on_selectable_confirm,
	on_confirm_args: ["Baz"],
	silent_on_confirm: false
});

menu.column_menu_add_selectable({ 
	label: "Item 4",
	on_confirm_func: menu_demo_on_selectable_confirm,
	on_confirm_args: ["Qux"],
	silent_on_confirm: false
});

menu.column_menu_add_selectable({ 
	label: "Item 5",
	on_confirm_func: menu_demo_on_selectable_confirm,
	on_confirm_args: ["Foo"],
	silent_on_confirm: false
});

menu.column_menu_add_spinner({ 
	label: "Item 6",
	values: ["A", 1, "B", 2, "C", 3],
	init_index: 0,
	on_confirm_func: -1,
	on_confirm_args: [],
	on_change_func: -1,
	on_change_args: [],
	silent_on_confirm: false,
	silent_on_change: false
});

menu.column_menu_add_selectable({ 
	label: "Item 7",
	on_confirm_func: menu_demo_on_selectable_confirm,
	on_confirm_args: ["Baz"],
	silent_on_confirm: false
});

vs_item = menu.column_menu_add_valued_selectable({ 
	label: "Item 8",
	init_value: "Qux",
	on_confirm_func: menu_demo_on_valued_selectable_confirm,
	on_confirm_args: ["Qux", "Dux"],
	on_change_func: menu_demo_on_valued_selectable_change,
	on_change_args: [],
	silent_on_confirm: false,
	silent_on_change: false
});

menu.view_scroll_arrows_margin = 24;
menu.view_scroll_arrows_x = 68;