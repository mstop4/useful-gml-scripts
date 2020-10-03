for (var i=0; i<num_items; i++) {
	var _item = items[| i];
	var _type = _item.types[| ds_list_size(_item.types)-1];
	
	switch (_type) {
		case "item":
		case "selectable":
			draw_text(x + cursor_width + cursor_padding, y + (item_height + line_spacing) * i, _item.label);
			break;
			
		case "spinner":
			draw_text(x + cursor_width + cursor_padding, y + (item_height + line_spacing) * i, _item.get_full_label());
			break;
		
		default:
			draw_text(x + cursor_width + cursor_padding, y + (item_height + line_spacing) * i, _item.label);
	}
}

draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * pos);