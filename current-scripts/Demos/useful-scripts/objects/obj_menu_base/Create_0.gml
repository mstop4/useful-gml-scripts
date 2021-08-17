enabled = true;

draw_set_font(menu_font);
item_height = string_height("Ij");
cursor_width = sprite_get_width(cursor_spr);

control_state = new MenuControlState();
active_key_config = noone;

menu_base_functions();