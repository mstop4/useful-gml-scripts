// Feather disable once GM2039
control_manager_functions();

players = ds_list_create();
num_players = 0;
device_count = gamepad_get_device_count();
gamepad_connected = array_create(device_count, false);
num_gamepads_connected = 0;
gamepad_discovery_mode = false;
gamepad_discovery_player_index = 0;
gamepad_on_discovered_func = pointer_null;
gamepad_on_discovered_params = [];