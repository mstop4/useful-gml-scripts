function menu_init(_config) {
	menu_font = _config.font;
	cursor_spr = _config.cursor_spr;
	cursor_padding = sprite_get_width(cursor_spr) + 16;
	cursor_move_sfx = _config.cursor_move_sfx;
	cursor_change_sfx = _config.cursor_change_sfx;
	cursor_confirm_sfx = _config.cursor_confirm_sfx;
	
	var _handler = asset_get_index(_config.control_handler);
	control_state.control_handler = _handler;
}

/// @func  add_menu_selectable(config)
/// @param config 
//         - label
//         - on_confirm_func
//         - on_confirm_args
//         - silent_on_confirm
function add_menu_selectable(_config) {
	var _new = new MenuSelectable(_config);
	ds_list_add(items, _new);
	num_items++;
}

/// @func  add_menu_spinner(config)
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
function add_menu_spinner(_config) {
	var _new = new MenuSpinner(_config);
	ds_list_add(items, _new);
	num_items++;
}