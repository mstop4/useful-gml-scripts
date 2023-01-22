event_inherited();
var _x = x + cursor_padding;
var _y = y;
var _y_offset = 0;
var _item;

if (view_height > 0 && view_scroll_progress_y.v != 0) {
	_y_offset = (item_height + line_spacing) * -view_scroll_progress_y.v;
}

for (var i=view_area.x; i<=view_area.y; i++) {
	_item = items[| i];
	
	if (is_struct(_item)) {
		if (view_height > 0) {
			if (view_scroll_progress_y.v < 0 && i == view_area.y) {
				// Scroll up last element
				draw_set_alpha(1-abs(view_scroll_progress_y.v));
			} else if (view_scroll_progress_y.v > 0 && i == view_area.x) {
				// Scroll down first element
				draw_set_alpha(1-abs(view_scroll_progress_y.v));
			} else {
				draw_set_alpha(menu_alpha.v);
			}
		}

		self.menu_base_draw_item(_item, _x, _y + _y_offset);
	}
	_y += item_height + line_spacing;
}

if (view_height > 0) {
	if (view_scroll_progress_y.v < 0 && view_area.x > 0) {
		// Scroll up first element
		_item = items[| view_area.x - 1];
		if (is_struct(_item)) {
			draw_set_alpha(abs(view_scroll_progress_y.v));
			self.menu_base_draw_item(_item, _x, y - (item_height + line_spacing) + _y_offset);
		}
	} else if (view_scroll_progress_y.v > 0 && view_area.y + 1 < num_items) {
		// Scroll down last element
		_item = items[| view_area.y + 1];
		if (is_struct(_item)) {
			draw_set_alpha(abs(view_scroll_progress_y.v));
			self.menu_base_draw_item(_item, _x, _y + _y_offset);
		}
	}
}

draw_set_alpha(menu_alpha.v);

if (enabled) {
	draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * (pos - view_area.x) + item_height / 2 + _y_offset);
	
	if (view_height > 0) {
		if (view_area.x > 0) {
			draw_sprite(view_scroll_arrows_spr, 0, x + view_scroll_arrows_x, y - view_scroll_arrows_margin);
		}

		if (view_area.y < num_items - 1) {
			draw_sprite_ext(view_scroll_arrows_spr, 0, x + view_scroll_arrows_x, _y + view_scroll_arrows_margin, 1, -1, 0, c_white, 1);
		}
	}
}