current_gamepad_index = wrap(current_gamepad_index - 1, 0, device_count);
my_player.set_gamepad_slot(current_gamepad_index);