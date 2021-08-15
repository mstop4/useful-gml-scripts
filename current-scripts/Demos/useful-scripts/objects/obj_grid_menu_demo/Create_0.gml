menu = instance_create_layer(32, 32, layer, obj_grid_menu);
menu.grid_menu_init({
	width: 2,
	height: 3,
	column_width: 160,
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

menu.grid_menu_add_spinner(0, 1, { 
	label: "Bar",
	values: ["A", 1, "B", 2, "C", 3],
	init_index: 0,
	on_confirm_func: -1,
	on_confirm_args: [],
	on_change_func: -1,
	on_change_args: [],
	silent_on_confirm: false,
	silent_on_change: false
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