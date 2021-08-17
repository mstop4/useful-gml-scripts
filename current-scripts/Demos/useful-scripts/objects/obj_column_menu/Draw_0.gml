draw_set_font(menu_font);
var _x = x + cursor_width + cursor_padding;

for (var i=0; i<num_items; i++) {
	var _item = items[| i];
	var _type = _item.types[| ds_list_size(_item.types)-1];
	
	var _y = y + (item_height + line_spacing) * i;
	
	switch (_type) {
		case "item":
		case "selectable":
			draw_text(_x, _y, _item.label);
			break;
			
		case "spinner":
			draw_text(_x, _y, _item.get_full_label());
			break;
			
		case "keyconfig":
			draw_text(_x, _y, _item.get_full_label());
			break;
		
		default:
			draw_text(_x, _y, _item.label);
	}
}

draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * pos);