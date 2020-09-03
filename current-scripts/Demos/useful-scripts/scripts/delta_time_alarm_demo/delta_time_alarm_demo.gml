function dta_demo_get_time_interval() {
	last_time_interval = current_time - last_timestamp;
	last_timestamp = current_time;
	effect_create_above(ef_firework, random(room_width), random(room_height), 0, c_aqua);
}