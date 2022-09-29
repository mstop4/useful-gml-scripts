event_inherited();
var _x = x + cursor_padding;

for (var i=view_area.x; i<=view_area.y; i++) {
	var _item = items[| i];
	var _type = _item.types[| ds_list_size(_item.types)-1];

	var _y = y + (item_height + line_spacing) * (i - view_area.x);

	switch (_type) {
		case "item":
		case "selectable":
			draw_text(_x, _y, _item.label);
			break;
			
	case "spinner":
		draw_text(_x, _y, _item.label);
		draw_text(_x + label_width, _y, _item.get_value());
		break;
			
	case "keyconfig":
		draw_text(_x, _y, _item.label);
		draw_text(_x + label_width, _y, _item.get_value());
		break;
		
		default:
			draw_text(_x, _y, _item.label);
	}
}

if (enabled) {
	draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * (pos - view_area.x) + item_height / 2);
}