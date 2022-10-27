start_timer = time_source_create(time_source_game, 1, time_source_units_frames, function() {
	room_goto(room_title);
});

time_source_start(start_timer);