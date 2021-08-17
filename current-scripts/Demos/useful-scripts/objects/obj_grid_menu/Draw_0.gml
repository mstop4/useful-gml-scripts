draw_set_font(menu_font);
for (var i=0; i<ds_grid_width(items); i++) {
	var _x = x + (cursor_width + cursor_padding) * (i+1) + column_width * i;

	for (var j=0; j<ds_grid_height(items); j++) {
		var _item = items[# i, j];
		if (!is_struct(_item)) continue;
		
		var _type = _item.types[| ds_list_size(_item.types)-1];
		var _y = y + (item_height + line_spacing) * j;
	
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
}

draw_sprite(cursor_spr, 0,
	x + (cursor_width + cursor_padding + column_width) * pos.x,
	y + (item_height + line_spacing) * pos.y
);