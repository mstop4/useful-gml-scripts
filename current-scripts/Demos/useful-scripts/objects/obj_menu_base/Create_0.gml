enabled = true;

item_height = 1;
cursor_width = 1;
cursor_height = 1;

control_state = new MenuControlState();
active_key_config = noone;
menu_alpha = new DynamicValue(1, 0, 0, 1, DVLimitMode.CLAMP, true);

next_menu = noone;
on_fade_out_end = noone;

menu_base_functions();