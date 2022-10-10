if (my_player.get_control_state(CONTROLS.EXIT, CONTROL_STATE.PRESSED)) {
	if (room == room_title) game_end();
	else room_goto(room_title);
}