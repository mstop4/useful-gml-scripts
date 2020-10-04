control_labels[CONTROLS.UP] = "Up";
control_labels[CONTROLS.DOWN] = "Down";
control_labels[CONTROLS.LEFT] = "Left";
control_labels[CONTROLS.RIGHT] = "Right";
control_labels[CONTROLS.A] = "A";
control_labels[CONTROLS.B] = "B";
control_labels[CONTROLS.C] = "C";

num_controls = CONTROLS.MAX;

control_manager = instance_create_layer(0, 0, layer, obj_control_manager);
control_manager.add_player();

control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.UP, vk_up);
control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.DOWN, vk_down);
control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.LEFT, vk_left);
control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.RIGHT, vk_right);
control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.A, ord("A"));
control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.B, ord("B"));
control_manager.players[| 0].set_control(CONTROL_TYPE.KEYBOARD, CONTROL_TYPE.KEYBOARD, CONTROLS.C, ord("C"));