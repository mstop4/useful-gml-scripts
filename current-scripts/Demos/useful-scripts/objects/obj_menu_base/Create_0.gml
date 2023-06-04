enabled = true;

control_state = noone;

item_height = 1;
cursor_width = 1;
cursor_height = 1;
use_control_icons = false;
keyboard_icons = [];
gamepad_icons = [];
control_icons_scale = 1;
control_icons_y_offset = -18;

discovery_mode = MENU_DISCOVERY_MODE.NONE;
active_key_config = noone;
menu_alpha = new Tween(1, 0, 0, 1, TWEEN_LIMIT_MODE.CLAMP, true);
view_scroll_progress_y = new Tween(0, 0, -1, 1, TWEEN_LIMIT_MODE.CLAMP, true);
view_scroll_arrow_height = sprite_get_height(view_scroll_arrows_spr);

next_menu = noone;
on_fade_out_end = noone;

// Feather disable once GM2039
menu_base_functions();