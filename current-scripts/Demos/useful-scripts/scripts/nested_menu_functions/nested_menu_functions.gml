/// @func  nested_menu_init(config)
/// @param config
//         - {}       player_controller
//         - {font}   font
//				 - {number} column_width
//         - {sprite} cursor_spr
//         - {sound}  cursor_move_sfx
//         - {sound}  cursor_change_sfx
//         - {sound}  cursor_confirm_sfx
function nested_menu_init(_config) {
	self.column_menu_init(_config);
	column_width = _config.column_width;
}

/// @func nested_menu_get_submenu_by_index(menu, index)
/// @param {obj_nested_menu} menu
/// @param {number} index
function nested_menu_get_item_by_index(_menu, _index) {
	return _menu.items[| _index];
}

/// @func column_menu_get_submenu_by_label(menu, label)
/// @param {obj_nested_menu} menu
/// @param {string} label
function nested_menu_get_item_by_label(_menu, _label) {
	for (var i=0; i<num_items; i++) {
		if (_menu.items[| i].label == _label) return _menu.submenu[| i];
	}
	
	return noone;
}

/// @func nested_menu_activate_submenu_by_index(menu, index)
/// @param {obj_nested_menu} menu
/// @param {number} index -1 = toggle root menu
function nested_menu_toggle_submenu_by_index(_menu, _index) {
	if (_index < -1 || _index >= _menu.num_items) return;
		_menu.active_item = noone;
	
	for (var i=0; i<_menu.num_items; i++) {
		var _item = _menu.nested_menu_get_item_by_index(_menu, i)
		var _submenu = _item.submenu;
		if (_index == i) {
			_submenu.enabled = true;
			_submenu.visible = true;
			_menu.active_item = _item;
		} else {
			_submenu.enabled = false;
			_submenu.visible = false;
		}
	}

	_menu.active_item_index = _index;

}

/// @func  nested_menu_add_submenu(config)
/// @param config 
//				 - {obj_menu_base} submenu
//         - {string}				 label
//         - {function}			 on_confirm_func
//         - {array}				 on_confirm_args
//         - {boolean}			 silent_on_confirm
function nested_menu_add_submenu(_config) {
	var _new = new NestedMenuSubmenu(_config);
	ds_list_add(items, _new);
	num_items++;
	_new.parent_menu = self;
	_new.submenu.enabled = false;
	_new.submenu.visible = false;
	_new.submenu.x = self.x + self.column_width;
	_new.submenu.y = self.y;
	return _new;
}