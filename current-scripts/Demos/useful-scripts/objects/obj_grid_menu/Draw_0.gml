event_inherited();
var _x_offset = 0;
var _y_offset = 0;

if (view_width > 0 && view_scroll_progress_x.v != 0) {
	_x_offset = (cursor_padding + column_width) * -view_scroll_progress_x.v;
}

if (view_height > 0 && view_scroll_progress_y.v != 0) {
	_y_offset = (item_height + line_spacing) * -view_scroll_progress_y.v;
}

for (var i=view_area.left; i<=view_area.right; i++) {
	var _x = x + cursor_padding * (i-view_area.left+1) + column_width * (i-view_area.left);
	var _y = y;

	for (var j=view_area.top; j<=view_area.bottom; j++) {
		var _item = items[# i, j];
		
		if (is_struct(_item)) {
			if (view_width > 0) {
				if (view_scroll_progress_x.v < 0 && i == view_area.right) {
					// Scroll left last element
					draw_set_alpha(1-abs(view_scroll_progress_x.v));
				} else if (view_scroll_progress_x.v > 0 && i == view_area.left) {
					// Scroll right first element
					draw_set_alpha(1-abs(view_scroll_progress_x.v));
				} else {
					draw_set_alpha(menu_alpha.v);
				}
			}
		
			if (view_height > 0) {
				if (view_scroll_progress_y.v < 0 && j == view_area.bottom) {
					// Scroll up last element
					draw_set_alpha(1-abs(view_scroll_progress_y.v));
				} else if (view_scroll_progress_y.v > 0 && j == view_area.top) {
					// Scroll down first element
					draw_set_alpha(1-abs(view_scroll_progress_y.v));
				} else {
					draw_set_alpha(menu_alpha.v);
				}
			}
		
			self.menu_base_draw_item(_item, _x + _x_offset, _y + _y_offset);
		}
		
		if (view_width > 0 && i == view_area.left) {
			if (view_scroll_progress_x.v < 0 && view_area.left > 0) {
				// Scroll left first element
				_item = items[# view_area.left - 1, j];
				if (is_struct(_item)) {
					draw_set_alpha(abs(view_scroll_progress_x.v));
					self.menu_base_draw_item(_item, x - column_width + _x_offset, _y + _y_offset);
				}
			} else if (view_scroll_progress_x.v > 0 && view_area.right + 1 < items_width) {
				// Scroll right last element
				_item = items[# view_area.right + 1, j];
				if (is_struct(_item)) {
					draw_set_alpha(abs(view_scroll_progress_x.v));
					self.menu_base_draw_item(_item, _x + (column_width + cursor_padding)*2  + _x_offset, _y + _y_offset);
				}
			}
		}
		
		_y += item_height + line_spacing;
	}
	
	if (view_height > 0) {
		if (view_scroll_progress_y.v < 0 && view_area.top > 0) {
			// Scroll up first element
			_item = items[# i, view_area.top - 1];
			if (is_struct(_item)) {
				draw_set_alpha(abs(view_scroll_progress_y.v));
				self.menu_base_draw_item(_item, _x + _x_offset, y - (item_height + line_spacing) + _y_offset);
			}
		} else if (view_scroll_progress_y.v > 0 && view_area.bottom + 1 < items_height) {
			// Scroll down last element
			_item = items[# i, view_area.bottom + 1];
			if (is_struct(_item)) {
				draw_set_alpha(abs(view_scroll_progress_y.v));
				self.menu_base_draw_item(_item, _x + _x_offset, _y + _y_offset);
			}
		}
	}
}

draw_set_alpha(menu_alpha.v);

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