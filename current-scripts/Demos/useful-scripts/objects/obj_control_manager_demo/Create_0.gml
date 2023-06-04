control_labels[CONTROLS.UP] = "Up";
control_labels[CONTROLS.DOWN] = "Down";
control_labels[CONTROLS.LEFT] = "Left";
control_labels[CONTROLS.RIGHT] = "Right";
control_labels[CONTROLS.SHOOT] = "Shoot";
control_labels[CONTROLS.JUMP] = "Jump";
control_labels[CONTROLS.INTERACT] = "Interact";
control_labels[CONTROLS.ITEM] = "Item";

control_prompts[CONTROLS.UP] = [0, 8, 16, 24];
control_prompts[CONTROLS.DOWN] = [1, 9, 17, 25];
control_prompts[CONTROLS.LEFT] = [2, 10, 18, 26];
control_prompts[CONTROLS.RIGHT] = [3, 11, 19, 27];
control_prompts[CONTROLS.SHOOT] = [4, 12, 22];
control_prompts[CONTROLS.JUMP] = [5, 13, 20];
control_prompts[CONTROLS.INTERACT] = [6, 14, 21];
control_prompts[CONTROLS.ITEM] = [7, 15, 23];

num_controls = 8;

my_player = inst_control_manager.get_player(0);

num_controllers_connected = 0;
current_gamepad_index = inst_control_manager.is_on_steam_deck()
	? inst_control_manager.get_steam_deck_gamepad_index()
	: 0;
device_count = gamepad_get_device_count();

for (var _i=0; _i<device_count; _i++) {
	var _is_connected = gamepad_is_connected(_i);
	if (_is_connected) {
		num_controllers_connected++;
	}
	gamepad_connected[_i] = _is_connected;
}

my_player.set_gamepad_slot(current_gamepad_index);