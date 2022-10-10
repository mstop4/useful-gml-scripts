event_inherited();

for (var i=view_area.left; i<=view_area.right; i++) {
	var _x = x + cursor_padding * (i-view_area.left+1) + column_width * i;

	for (var j=view_area.top; j<=view_area.bottom; j++) {
		var _item = items[# i, j];
		if (!is_struct(_item)) continue;

		var _y = y + (item_height + line_spacing) * (j-view_area.top);
		self.menu_base_draw_item(_item, _x, _y);
	}
}

if (enabled) {
	draw_sprite(cursor_spr, 0,
		x + (cursor_padding + column_width) * (pos.x - view_area.left),
		y + (item_height + line_spacing) * (pos.y - view_area.top) + item_height / 2
	);
}