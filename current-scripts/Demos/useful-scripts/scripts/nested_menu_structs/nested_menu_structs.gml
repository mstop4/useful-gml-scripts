/// @func  NestedMenuSubmenu(config)
/// @param _config
//				 - {obj_menu_base} submenu
//         - {string}        label
//         - {function}      on_confirm_func
//         - {array}         on_confirm_args
//         - {boolean}       silent_on_confirm
function NestedMenuSubmenu(_config) : MenuSelectable(_config) constructor {
	type = "menu";
	submenu = _config.submenu;
}