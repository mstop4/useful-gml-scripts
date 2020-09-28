items = ds_list_create();
num_items = 0;
pos = 0;

draw_set_font(menu_font);
item_height = string_height("Ij");
cursor_width = sprite_get_width(cursor_spr);

control_state = new MenuControlState();

menu_functions();