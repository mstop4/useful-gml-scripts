function init_steam_deck_info() {
	steam_deck_info = get_steam_deck_info();
}

function add_player() {
	var _new_player = new ControlManagerPlayer();
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