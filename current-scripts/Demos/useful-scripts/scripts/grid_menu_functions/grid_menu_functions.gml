/// @func  grid_menu_init(config)
/// @param config 
//         - {real}   width
//         - {real}   height
//		     - {real}   view_width
//         - {real}   view_height
//				 - {number} column_width
//				 - {}       player_controller
//         - {font}   label_font
//         - {font}   value_font
//         - {sprite} cursor_spr
//         - {sound}  cursor_move_sfx
//         - {sound}  cursor_change_sfx
//         - {sound}  cursor_confirm_sfx
//				 - {boolean} use_control_icons
//				 - {Array.<Sprite>} keyboard_icons
//				 - {Array.<Sprite>} gamepad_icons
function grid_menu_init(_config) {
	self.menu_base_init(_config);
	
	column_width = _config.column_width;
	view_width = _config.view_width;
	view_height = _config.view_height;
	menu_label_font = _config.label_font;
	menu_value_font = _config.value_font;
	cursor_spr = _config.cursor_spr;
	cursor_padding = sprite_get_width(cursor_spr) + 16;
	cursor_move_sfx = _config.cursor_move_sfx;
	cursor_change_sfx = _config.cursor_change_sfx;
	cursor_confirm_sfx = _config.cursor_confirm_sfx;
	
	ds_grid_resize(items, _config.width, _config.height);
	items_width = _config.width;
	items_height = _config.height;
	
	view_area.left = 0;
	view_area.right = view_width < 1
		? _config.width - 1
		: _config.view_width - 1;


	view_area.top = 0;
	view_area.bottom = view_height < 1
		? _config.height - 1
		: _config.view_height - 1;
}

function grid_menu_start_scroll_up() {
	view_scroll_progress_x.v = 0;
	view_scroll_progress_x.d = 0;
	view_scroll_progress_y.v = 1;
	view_scroll_progress_y.d = -1/view_scroll_duration;
}

function grid_menu_start_scroll_down() {
	view_scroll_progress_x.v = 0;
	view_scroll_progress_x.d = 0;
	view_scroll_progress_y.v = -1;
	view_scroll_progress_y.d = 1/view_scroll_duration;
}

function grid_menu_start_scroll_left() {
	view_scroll_progress_x.v = 1;
	view_scroll_progress_x.d = -1/view_scroll_duration;
	view_scroll_progress_y.v = 0;
	view_scroll_progress_y.d = 0;
}

function grid_menu_start_scroll_right() {
	view_scroll_progress_x.v = -1;
	view_scroll_progress_x.d = 1/view_scroll_duration;
	view_scroll_progress_y.v = 0;
	view_scroll_progress_y.d = 0;
}

/// @func grid_menu_update_view()
function grid_menu_update_view() {
	var _changed = {
		x: false,
		y: false,
	};	
	
	if (view_height > 0) {
		if (pos.y < view_area.top) {
			view_area.top = pos.y;
			view_area.bottom = pos.y + view_height - 1;
			_changed.y = true;
		} else if (pos.y > view_area.bottom) {
			view_area.bottom = pos.y;
			view_area.top = pos.y - (view_height - 1);
			_changed.y = true;
		}
	}

	if (view_width > 0) {
		if (pos.x < view_area.left) {
			view_area.left = pos.x;
			view_area.right = pos.x + view_height - 1;
			_changed.x = true;
		} else if (pos.x > view_area.right) {
			view_area.right = pos.x;
			view_area.left = pos.x - (view_height - 1);
			_changed.x = true;
		}
	}
	
	return _changed;
}

/// @func grid_menu_get_item_by_index(menu, x, y)
/// @param {obj_grid_menu} menu
/// @param {number} x
/// @param {number} y
function grid_menu_get_item_by_index(_menu, _x, _y) {
	return _menu.items[# _x, _y];
}

/// @func grid_menu_get_item_by_label(menu, label)
/// @param {obj_grid_menu} menu
/// @param {string} label
function grid_menu_get_item_by_label(_menu, _label) {
	var _width = ds_grid_width(items);
	var _height = ds_grid_height(items);
	
	for (var i=0; i<_width; i++) {
		for (var j=0; j<_height; j++) {		
			if (_menu.items[# i, j].label == _label) return _menu.items[# i, j];
		}
	}
	
	return noone;
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
		|| _y < 0 || _y >= ds_grid_height(items))
			return;
	
	var _new = new MenuSelectable(_config);
	_new.parent_menu = self;
	items[# _x, _y] = _new;
	return _new;
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
		|| _y < 0 || _y >= ds_grid_height(items))
			return;
	
	var _new = new MenuSpinner(_config);
	_new.parent_menu = self;
	items[# _x, _y] = _new;
	return _new;
}

/// @param grid_menu_add_key_config(x, y, config)
/// @param x
/// @param y
/// @param config 
//         - {string}   label
//				 - {CONTROLS} control
//         - {array}    initial_kbm_bindings
//         - {array}    initial_gamepad_bindings
//         - {function} on_change_func
//         - {array}    on_change_args
//         - {boolean}  silent_on_confirm
//         - {boolean}  silent_on_change
function grid_menu_add_key_config(_x, _y, _config) {
	if (_x < 0 || _x >= ds_grid_width(items)
		|| _y < 0 || _y >= ds_grid_height(items))
			return;
			
	var _new = new MenuKeyConfig(_config);
	_new.parent_menu = self;
	items[# _x, _y] = _new;
	return _new;
}

/// @param grid_menu_add_divider(x, y, config)
/// @param x
/// @param y
/// @param config 
//         - {string}   label
function grid_menu_add_divider(_x, _y, _config) {
	if (_x < 0 || _x >= ds_grid_width(items)
		|| _y < 0 || _y >= ds_grid_height(items))
			return;
			
	var _new = new MenuDivider(_config);
	_new.parent_menu = self;
	items[# _x, _y] = _new;
	return _new;
}