menu = instance_create_layer(32, 32, layer, obj_menu);
menu.menu_init(fnt_demo, spr_arrow, "menu_demo_control_handler");

menu.add_menu_selectable("Foo", -1);
menu.add_menu_selectable("Bar", -1);
menu.add_menu_selectable("Baz", -1);
menu.add_menu_selectable("Qux", -1);