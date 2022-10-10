current_gamepad_index = inst_control_manager.is_on_steam_deck()
	? inst_control_manager.get_steam_deck_gamepad_index()
	: 0;
	
my_player.set_gamepad_slot(current_gamepad_index);