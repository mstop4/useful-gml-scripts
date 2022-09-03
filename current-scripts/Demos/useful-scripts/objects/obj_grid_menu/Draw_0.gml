event_inherited();

for (var i=view_area.left; i<=view_area.right; i++) {
	var _x = x + cursor_padding * (i-view_area.left+1) + column_width * i;

	for (var j=view_area.top; j<=view_area.bottom; j++) {
		var _item = items[# i, j];
		if (!is_struct(_item)) continue;

		var _type = _item.types[| ds_list_size(_item.types)-1];
		var _y = y + (item_height + line_spacing) * (j-view_area.top);
	
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

if (enabled) {
	draw_sprite(cursor_spr, 0,
		x + (cursor_padding + column_width) * (pos.x - view_area.left),
		y + (item_height + line_spacing) * (pos.y - view_area.top) + item_height / 2
	);
}