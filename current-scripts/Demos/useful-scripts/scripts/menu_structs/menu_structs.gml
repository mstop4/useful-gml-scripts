enum MENU_CONTROLS {
	UP,
	DOWN,
	LEFT,
	RIGHT,
	CONFIRM,
	CANCEL
}

function MenuItem(_label) constructor {
	label = _label;
}

function MenuSelectable(_label, _on_confirm) : MenuItem(_label) constructor {
	on_confirm = _on_confirm;
}