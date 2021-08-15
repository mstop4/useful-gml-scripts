for (var i=0; i<ds_grid_width(items); i++) {
	for (j=0; j<ds_grid_height(items); j++) {
		var _item = items[# i, j];
		if (!is_struct(_item)) continue;
		
		var _type = _item.types[| ds_list_size(_item.types)-1];
	
		switch (_type) {
			case "item":
			case "selectable":
				draw_text(x + (cursor_width + cursor_padding) * (i+1) + column_width * i, y + (item_height + line_spacing) * j, _item.label);
				break;
			
			case "spinner":
				draw_text(x + (cursor_width + cursor_padding) * (i+1) + column_width * i, y + (item_height + line_spacing) * j, _item.get_full_label());
				break;
		
			default:
				draw_text(x + (cursor_width + cursor_padding) * (i+1) + column_width * i, y + (item_height + line_spacing) * j, _item.label);
		}
	}
}

draw_sprite(cursor_spr, 0,
	x + (cursor_width + cursor_padding + column_width) * pos.x,
	y + (item_height + line_spacing) * pos.y
);
draw_text(0, 320, string(pos.x) + ", " + string(pos.y));