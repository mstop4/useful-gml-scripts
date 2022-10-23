rooms = [
	room_control_manager_demo,
	room_data_structures_demo,
	room_drawing_demo,
	room_dta_demo,
	room_easing_demo,
	room_laser_demo,
	room_input_demo,
	room_math_demo,
	room_column_menu_demo,
	room_grid_menu_demo,
	room_nested_menu_demo,
	room_key_config_menu_demo,
	room_strings_demo,
	room_web_demo,
	room_system_info
];
num_rooms = array_length(rooms);

room_names = [
	"Control Manager",
	"Data Structures",
	"Drawing",
	"Delta Time Alarm (deprecated)",
	"Easings",
	"Geometry",
	"Input",
	"Math",
	"Column Menu",
	"Grid Menu",
	"Nested Menu",
	"Control Config Menu",
	"Strings",
	"Web",
	"System Info"
];

menu = instance_create_layer(32, 64, layer, obj_column_menu);
menu.column_menu_init({
	player_controller: inst_control_manager.get_player(0),
	font: fnt_demo,
	view_height: 0,
	cursor_spr: spr_arrow, 
	cursor_move_sfx: snd_menu_move,
	cursor_change_sfx: -1,
	cursor_confirm_sfx: -1,
	use_control_icons: false,
	keyboard_icons: [],
	gamepad_icons: [],
	control_icons_scale: 1,
});
menu.line_spacing = 8;

for (var i=0; i<num_rooms; i++) {
	menu.column_menu_add_selectable({
		label: room_names[i],
		on_confirm_func: "go_to_demo",
		on_confirm_args: [ rooms[i] ],
		silent_on_confirm: false
	});
}