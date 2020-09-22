function menu_init(_font, _cursor_sprite) {
	menu_font = _font;
	cursor_spr = _cursor_sprite;
}

function add_menu_selectable(_label, _on_confirm) {
	var _new = new MenuSelectable(_label, _on_confirm);
	ds_list_add(menu_items, _new);
	num_menu_items++;
}