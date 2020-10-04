function add_player() {
	var _new_player = new ControlManagerPlayer();
	ds_list_add(players, _new_player);
	num_players++;
	return _new_player;
}

function reset_cache() {
	delete input_state_cache;
	input_state_cache = {
		keyboard: {
			held: {},
			pressed: {},
			released: {},
			any: false
		},
		
		mouse: {
			held: {},
			pressed: {},
			released: {},
			any: false
		},
		
		gamepad: {
			held: {},
			pressed: {},
			released: {},
			any: false
		},
	};
}