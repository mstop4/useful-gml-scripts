function menu_init(_font, _cursor_sprite, _control_handler) {
	menu_font = _font;
	cursor_spr = _cursor_sprite;
	cursor_padding = sprite_get_width(_cursor_sprite) + 16;
	
	var _handler = asset_get_index(_control_handler);
	control_state.control_handler = _handler;
}

function add_menu_selectable(_label, _on_confirm, _arg_array) {
	var _new = new MenuSelectable(_label, _on_confirm, _arg_array);
	ds_list_add(items, _new);
	num_items++;
}