/// @func  nested_menu_init(config)
/// @param _config
//         - {}       player_controller
//         - {Asset.GMFont}   font
//				 - {real} column_width
//         - {Asset.GMSprite} cursor_spr
//         - {Asset.GMSound}  cursor_move_sfx
//         - {Asset.GMSound}  cursor_change_sfx
//         - {Asset.GMSound}  cursor_confirm_sfx
//				 - {bool} use_control_icons
//				 - {Array<Asset.GMSprite>} keyboard_icons
//				 - {Array<Asset.GMSprite>} gamepad_icons
function nested_menu_init(_config) {
	self.column_menu_init(_config);
	column_width = _config.column_width;
}

/// @func nested_menu_get_submenu_by_index(menu, index)
/// @param {Id.Instance} _menu obj_nested_menu
/// @param {real} _index
function nested_menu_get_item_by_index(_menu, _index) {
	return _menu.items[| _index];
}

/// @func column_menu_get_submenu_by_label(menu, label)
/// @param {Id.Instance} _menu obj_nested_menu
/// @param {string} _label
/// @returns {any}
function nested_menu_get_item_by_label(_menu, _label) {
	for (var _i=0; _i<num_items; _i++) {
		if (_menu.items[| _i].label == _label) return _menu.submenu[| _i];
	}
	
	return noone;
}

/// @func nested_menu_activate_submenu_by_index(menu, index)
/// @param {Id.Instance} _menu obj_nested_menu
/// @param {real} _index -1 = toggle root menu
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
	column_menu_update_view_area();
	return _new;
}