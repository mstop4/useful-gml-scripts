/// @func init_steam_deck_info
/// @desc Calls get_steam_deck_info from system scripts and stores results locally.
///       Note: Doesn't work if called at the very start of the game. Wait a few steps before calling it.
function init_steam_deck_info() {
	steam_deck_info = get_steam_deck_info();
}

function add_player() {
	var _new_player = new ControlManagerPlayer(id);
	ds_list_add(players, _new_player);
	num_players++;
	return num_players-1;
}

function get_player(_index) {
	if (ds_list_size(self.players) > _index) {
		return self.players[| _index];
	}
	
	return noone;
}

function is_on_steam_deck() {
	return self.steam_deck_info.is_on_steam_deck;
}

function get_steam_deck_gamepad_index() {
	return self.steam_deck_info.gamepad_index;
}

/// @desc Checks the connection status of devices
function check_device_connection_statuses() {
	gamepad_connected = array_create(device_count, false);
	num_gamepads_connected = 0;

	for (var _i=0; _i<device_count; _i++) {
		var _is_connected = gamepad_is_connected(_i);
		if (_is_connected) {
			num_gamepads_connected++;
		}
		gamepad_connected[_i] = _is_connected;
	}
}


/// @desc Starts listening for any input on any gamepad
function start_gamepad_discovery_mode(_player_index) {
	gamepad_discovery_mode = true;
	gamepad_discovery_player_index = _player_index;
}

/// @desc Listens for any input on any gamepad. If detected, returns device index
function listen_for_gamepad_input() {
	var _gamepad_index = -1;
	
	for (var _i=0; _i<device_count; _i++) {
		if (_gamepad_index != -1) break;

		for (var _j=gp_face1; _j<=gp_padr; _j++) {
			if (gamepad_button_check_pressed(_i, _j)) {
				_gamepad_index = _i;
				break;
			}
		}
	}
	
	if (_gamepad_index != -1) {
		self.stop_gamepad_discovery_mode();
		self.players[| self.gamepad_discovery_player_index].set_gamepad_slot(_gamepad_index);
	}
}

/// @desc Stop listening for input on any gamepad
function stop_gamepad_discovery_mode() {
	gamepad_discovery_mode = false;
}