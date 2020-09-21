
try {
	var in_key = real(keyboard_lastchar);
	if (in_key > 0 && in_key <= num_rooms) {
		room_goto(rooms[in_key-1]);
	}
} catch(_error) {
	print(_error.message);
}