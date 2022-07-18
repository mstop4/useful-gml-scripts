control_labels[CONTROLS.UP] = "Up";
control_labels[CONTROLS.DOWN] = "Down";
control_labels[CONTROLS.LEFT] = "Left";
control_labels[CONTROLS.RIGHT] = "Right";
control_labels[CONTROLS.SHOOT] = "Shoot";
control_labels[CONTROLS.JUMP] = "Jump";
control_labels[CONTROLS.INTERACT] = "Interact";
control_labels[CONTROLS.ITEM] = "Item";

num_controls = CONTROLS.MAX;

control_manager = instance_create_layer(0, 0, layer, obj_control_manager);
var _player_index = control_manager.add_player();
my_player = control_manager.get_player(_player_index);

my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.UP, 0, vk_up);
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.DOWN, 0, vk_down);
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.LEFT, 0, vk_left);
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.RIGHT, 0, vk_right);
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.SHOOT, 0, ord("Z"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.JUMP, 0, ord("X"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.INTERACT, 0, ord("C"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.ITEM, 0, ord("V"));

my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.UP, 1, ord("W"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.DOWN, 1, ord("S"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.LEFT, 1, ord("A"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.RIGHT, 1, ord("D"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.SHOOT, 1, ord("L"));
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.JUMP, 1, vk_semicolon);
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.INTERACT, 1, vk_single_quote);
my_player.set_binding(CONTROL_TYPE.KEYBOARD, CONTROL_SOURCE.KEYBOARD, CONTROLS.ITEM, 1, ord("P"));

my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.UP, 0,  gp_padu);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.DOWN, 0,  gp_padd);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.LEFT, 0, gp_padl);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.RIGHT, 0, gp_padr);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.SHOOT, 0, gp_face3);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.JUMP, 0, gp_face1);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.INTERACT, 0, gp_face2);
my_player.set_binding(CONTROL_TYPE.GAMEPAD, CONTROL_SOURCE.GAMEPAD, CONTROLS.ITEM, 0, gp_face4);