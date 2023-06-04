// Feather ignore once GM1043
start_timer = time_source_create(time_source_game, 1, time_source_units_frames, function() {
	inst_control_manager.init_steam_deck_info();
	
	with (obj_persistent_controller) {
		current_gamepad_index = inst_control_manager.is_on_steam_deck()
			? inst_control_manager.get_steam_deck_gamepad_index()
			: 0;
	
		my_player.set_gamepad_slot(current_gamepad_index);
	}
	time_source_destroy(start_timer);
	room_goto(room_title);
});

time_source_start(start_timer);