/// @desc fade in end
enabled = true;

if (is_callable(on_fade_in_end)) {
	on_fade_in_end(on_fade_in_end_args);
	on_fade_in_end = noone;
}