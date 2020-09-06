menu_items = ds_list_create();
menu_pos = 0;
num_menu_items = 0;

draw_set_font(menu_font);
item_height = string_height("Ij");
cursor_width = sprite_get_width(cursor_spr);

menu_functions();