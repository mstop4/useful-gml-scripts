menu = instance_create_layer(32, 32, layer, obj_menu);
menu.cursor_spr = spr_arrow;
menu.cursor_padding = sprite_get_width(menu.cursor_spr) + 16;

menu.add_menu_selectable("Foo", -1);
menu.add_menu_selectable("bar", -1);