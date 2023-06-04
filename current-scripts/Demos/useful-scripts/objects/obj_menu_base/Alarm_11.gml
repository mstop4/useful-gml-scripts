/// @desc fade out end
visible = false;

if (is_callable(on_fade_out_end)) {
	// feather ignore once GM1021
	on_fade_out_end(on_fade_out_end_args);
	on_fade_out_end = noone;
}

if (instance_exists(next_menu)) {
	next_menu.menu_fade_in();
}

next_menu = noone;