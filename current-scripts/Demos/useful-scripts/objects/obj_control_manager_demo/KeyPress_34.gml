current_gamepad_index = wrap(current_gamepad_index - 1, 0, inst_control_manager.device_count);
my_player.set_gamepad_slot(current_gamepad_index);