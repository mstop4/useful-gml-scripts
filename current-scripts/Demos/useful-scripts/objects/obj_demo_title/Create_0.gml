rooms = [
	room_drawing_demo,
	room_dta_demo,
	room_easing_demo,
	room_laser_demo,
	room_input_demo,
	room_math_demo,
	room_menu_demo,
	room_strings_demo,
	room_web_demo
];
num_rooms = array_length(rooms);

room_names = [
	"Drawing",
	"Delta Time Alarm",
	"Easings",
	"Geometry",
	"Input",
	"Math",
	"Menu",
	"Strings",
	"Web"
];

menu = instance_create_layer(32, 64, layer, obj_menu);
menu.menu_init(fnt_demo, spr_arrow, "menu_demo_control_handler");
menu.line_spacing = 16;

for (var i=0; i<num_rooms; i++) {
	menu.add_menu_selectable(room_names[i], "go_to_demo", [ rooms[i] ]);
}