/// @func  grid_menu_init(config)
/// @param config 
//         - {real}   width
//         - {real}   height
//				 - {number} column_width
//         - {font}   font
//         - {sprite} cursor_spr
//         - {sound}  cursor_move_sfx
//         - {sound}  cursor_change_sfx
//         - {sound}  cursor_confirm_sfx
function grid_menu_init(_config) {
	column_width = _config.column_width;
	menu_font = _config.font;
	cursor_spr = _config.cursor_spr;
	cursor_padding = sprite_get_width(cursor_spr) + 16;
	cursor_move_sfx = _config.cursor_move_sfx;
	cursor_change_sfx = _config.cursor_change_sfx;
	cursor_confirm_sfx = _config.cursor_confirm_sfx;
	
	ds_grid_resize(items, _config.width, _config.height);
}

/// @func  grid_menu_add_selectable(x, y, config)
/// @param x
/// @param y
/// @param config
//         - {string}   label
//         - {function} on_confirm_func
//         - {array}    on_confirm_args
//         - {boolean}  silent_on_confirm
function grid_menu_add_selectable(_x, _y, _config) {
	if (_x < 0 || _x >= ds_grid_width(items)
		|| _y < 0 || _x >= ds_grid_height(items))
			return;
	
	var _new = new MenuSelectable(_config);
	items[# _x, _y] = _new;
}

/// @func  grid_menu_add_spinner(x, y, config)
/// @param x
/// @param y
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
function grid_menu_add_spinner(_x, _y, _config) {
	if (_x < 0 || _x >= ds_grid_width(items)
		|| _y < 0 || _x >= ds_grid_height(items))
			return;
	
	var _new = new MenuSpinner(_config);
	items[# _x, _y] = _new;
}