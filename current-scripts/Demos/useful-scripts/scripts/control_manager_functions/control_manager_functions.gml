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