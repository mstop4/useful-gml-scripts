/// @func  column_menu_init(config)
/// @param config
//         - {font}   font
//         - {sprite} cursor_spr
//         - {sound}  cursor_move_sfx
//         - {sound}  cursor_change_sfx
//         - {sound}  cursor_confirm_sfx
function column_menu_init(_config) {
	self.menu_base_init(_config.font, _config.cursor_spr);
	
	menu_font = _config.font;
	cursor_spr = _config.cursor_spr;
	cursor_padding = sprite_get_width(cursor_spr) + 16;
	cursor_move_sfx = _config.cursor_move_sfx;
	cursor_change_sfx = _config.cursor_change_sfx;
	cursor_confirm_sfx = _config.cursor_confirm_sfx;
}

/// @func column_menu_get_item_by_index(index)
/// @param {number} index
function column_menu_get_item_by_index(_index) {
	return self.items[| _index];
}

/// @func column_menu_get_item_by_label(label)
/// @param {string} label
function column_menu_get_item_by_label(_label) {
	for (var i=0; i<num_items; i++) {
		if (self.items[| i].label == _label) return self.items[| i];
	}
	
	return noone;
}

/// @func  column_menu_add_selectable(config)
/// @param config 
//         - {string}   label
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {boolean}  silent_on_confirm
function column_menu_add_selectable(_config) {
	var _new = new MenuSelectable(_config);
	ds_list_add(items, _new);
	num_items++;
	_new.parent_menu = self;
		return _new;
}

/// @func  column_menu_add_spinner(config)
/// @param config 
//         - {string}   label
//         - {array}    values
//         - {integer}  init_index
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
//         - {boolean}  silent_on_change
function column_menu_add_spinner(_config) {
	var _new = new MenuSpinner(_config);
	ds_list_add(items, _new);
	num_items++;
	_new.parent_menu = self;
	return _new;
}

/// @param column_menu_add_key_config(config)
/// @param config 
//         - {string}   label
//         - {array}    inital_keycode
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {boolean}  silent_on_confirm
function column_menu_add_key_config(_config) {
	var _new = new MenuKeyConfig(_config);
	ds_list_add(items, _new);
	num_items++;
	_new.parent_menu = self;
	return _new;
}