/// @desc fade out end
visible = false;

if (script_exists(on_fade_out_end)) {
	script_execute(on_fade_out_end, on_fade_out_end_args);
	on_fade_out_end = noone;
}

if (instance_exists(next_menu)) {
	next_menu.menu_fade_in();
}

next_menu = noone;