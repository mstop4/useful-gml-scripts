control_labels[CONTROLS.UP] = "Up";
control_labels[CONTROLS.DOWN] = "Down";
control_labels[CONTROLS.LEFT] = "Left";
control_labels[CONTROLS.RIGHT] = "Right";
control_labels[CONTROLS.A] = "A";
control_labels[CONTROLS.B] = "B";
control_labels[CONTROLS.X] = "X";
control_labels[CONTROLS.Y] = "Y";

num_controls = CONTROLS.MAX;

control_manager = instance_create_layer(0, 0, layer, obj_control_manager);
my_player = control_manager.add_player();

my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.UP, vk_up);
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.DOWN, vk_down);
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.LEFT, vk_left);
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.RIGHT, vk_right);
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.A, ord("A"));
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.B, ord("B"));
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.X, ord("X"));
my_player.set_control_map(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.MOUSE, CONTROLS.Y, mb_left);

my_player.set_control_map(CONTROL_TYPE.GAMEPAD, -1, CONTROLS.A, gp_face1);
my_player.set_control_map(CONTROL_TYPE.GAMEPAD, -1, CONTROLS.B, gp_face2);
my_player.set_control_map(CONTROL_TYPE.GAMEPAD, -1, CONTROLS.X, gp_face3);
my_player.set_control_map(CONTROL_TYPE.GAMEPAD, -1, CONTROLS.Y, gp_face4);