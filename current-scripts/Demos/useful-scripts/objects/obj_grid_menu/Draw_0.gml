event_inherited();

for (var i=view_area.left; i<=view_area.right; i++) {
	var _x = x + cursor_padding * (i-view_area.left+1) + column_width * (i-view_area.left);
	var _y = y;

	for (var j=view_area.top; j<=view_area.bottom; j++) {
		var _item = items[# i, j];
		if (!is_struct(_item)) continue;

		self.menu_base_draw_item(_item, _x, _y);
		_y += item_height + line_spacing;
	}
}

if (enabled) {
	draw_sprite(cursor_spr, 0,
		x + (cursor_padding + column_width) * (pos.x - view_area.left),
		y + (item_height + line_spacing) * (pos.y - view_area.top) + item_height / 2
	);
	
	if (view_height >= 1) {
		if (view_area.top > 0) {
			draw_sprite(view_scroll_arrows_spr, 0, x + view_scroll_arrows_x, y - view_scroll_arrows_margin);
		}

		if (view_area.bottom < items_height - 1) {
			draw_sprite_ext(view_scroll_arrows_spr, 0, x + view_scroll_arrows_x, _y + view_scroll_arrows_margin, 1, -1, 0, c_white, 1);
		}
	}
	if (view_width >= 1) {
		if (view_area.left > 0){
			draw_sprite_ext(view_scroll_arrows_spr, 0, x - view_scroll_arrows_margin, y + view_scroll_arrows_y, 1, 1, 90, c_white, 1);
		}

		if (view_area.right < items_width - 1) {
			draw_sprite_ext(view_scroll_arrows_spr, 0, _x + view_scroll_arrows_margin + cursor_padding, y + view_scroll_arrows_y, 1, 1, 270, c_white, 1);
		}
	}
}
draw_set_alpha(1);