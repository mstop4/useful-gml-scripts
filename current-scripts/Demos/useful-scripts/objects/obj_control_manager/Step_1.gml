for (var _i=0; _i<num_players; _i++) {
	players[| _i].process_input();
}

if (gamepad_discovery_mode) {
	self.listen_for_gamepad_input();
}