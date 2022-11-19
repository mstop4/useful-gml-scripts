enabled = true;

item_height = 1;
cursor_width = 1;
cursor_height = 1;
use_control_icons = false;
keyboard_icons = [];
gamepad_icons = [];
control_icons_scale = 1;

discovery_mode = MENU_DISCOVERY_MODE.NONE;
active_key_config = noone;
menu_alpha = new Tween(1, 0, 0, 1, TweenLimitMode.CLAMP, true);
view_scroll_arrow_height = sprite_get_height(view_scroll_arrows_spr);

next_menu = noone;
on_fade_out_end = noone;

menu_base_functions();