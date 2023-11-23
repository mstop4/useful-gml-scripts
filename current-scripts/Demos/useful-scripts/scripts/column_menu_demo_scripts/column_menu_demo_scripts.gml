// Feather disable once GM1064
function menu_demo_on_selectable_confirm(_args) {
	show_message(_args[0]);
}

function menu_demo_on_valued_selectable_confirm(_item, _args) {
	var _cur_value = _item.get_value();
	if (_cur_value == _args[0]) _item.set_value(_args[1]);
	else _item.set_value(_args[0]);
}

function menu_demo_on_valued_selectable_change(_args) {
	show_message("Change!");
}