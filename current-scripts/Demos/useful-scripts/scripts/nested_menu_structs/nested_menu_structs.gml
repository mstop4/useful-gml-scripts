/// @func  NestedMenuSubmenu(config)
/// @param config
//				 - {obj_menu_base} submenu
//         - {string}        label
//         - {function}      on_confirm_func
//         - {array}         on_confirm_args
//         - {boolean}       silent_on_confirm
function NestedMenuSubmenu(_config) : MenuSelectable(_config) constructor {
	ds_list_add(types, "menu");
	submenu = _config.submenu;
}