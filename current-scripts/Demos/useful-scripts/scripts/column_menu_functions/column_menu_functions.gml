/// @func  column_menu_init(config)
/// @param config
//         - {real} view_height
//				 - {}       player_controller
//         - {font}   font
//         - {sprite} cursor_spr
//         - {sound}  cursor_move_sfx
//         - {sound}  cursor_change_sfx
//         - {sound}  cursor_confirm_sfx
function column_menu_init(_config) {
	self.menu_base_init(_config.player_controller, _config.font, _config.cursor_spr);
	
  view_height = _config.view_height;
	menu_font = _config.font;
	cursor_spr = _config.cursor_spr;
	cursor_padding = sprite_get_width(cursor_spr) + 16;
	cursor_move_sfx = _config.cursor_move_sfx;
	cursor_change_sfx = _config.cursor_change_sfx;
	cursor_confirm_sfx = _config.cursor_confirm_sfx;
}

/// @func column_menu_update_view()
function column_menu_update_view() {
	if (view_height > 0) {
		if (pos < view_area.x) {
			view_area.x = pos;
			view_area.y = pos + view_height - 1;
		} else if (pos > view_area.y) {
			view_area.y = pos;
			view_area.x = pos - (view_height - 1);
		}
	}
}

/// @func column_menu_update_view_area()
function column_menu_update_view_area() {
	view_area.y = view_height < 1
		? num_items - 1
		: min(num_items, pos + view_height - 1);
}

/// @func column_menu_get_item_by_index(menu, index)
/// @param {obj_column_menu} menu
/// @param {number} index
function column_menu_get_item_by_index(_menu, _index) {
	return _menu.items[| _index];
}

/// @func column_menu_get_item_by_label(menu, label)
/// @param {obj_column_menu} menu
/// @param {string} label
function column_menu_get_item_by_label(_menu, _label) {
	for (var i=0; i<num_items; i++) {
		if (_menu.items[| i].label == _label) return _menu.items[| i];
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
	column_menu_update_view_area();
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
	column_menu_update_view_area();
	return _new;
}

/// @param column_menu_add_key_config(config)
/// @param config 
//         - {string}   label
//				 - {CONTROLS} control
//         - {array}    initial_kbm_bindings
//         - {array}    initial_gamepad_bindings
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
//         - {boolean}  silent_on_change
function column_menu_add_key_config(_config) {
	var _new = new MenuKeyConfig(_config);
	ds_list_add(items, _new);
	num_items++;
	_new.parent_menu = self;
	column_menu_update_view_area();
	return _new;
}