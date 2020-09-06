function MenuItem(_label) constructor {
	label = _label;
}

function MenuButton(_label, _on_confirm) : MenuItem(_label) constructor {
	on_confirm = _on_confirm;
}