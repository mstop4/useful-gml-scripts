function add_player() {
	var _new_player = new ControlManagerPlayer();
	ds_list_add(players, _new_player);
	num_players++;
	return _new_player;
}