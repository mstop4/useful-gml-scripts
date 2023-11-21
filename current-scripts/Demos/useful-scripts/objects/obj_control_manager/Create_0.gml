// Feather disable once GM2039
control_manager_functions();

players = ds_list_create();
num_players = 0;
device_count = gamepad_get_device_count();
gamepad_connected = array_create(device_count, false);
num_gamepads_connected = 0;