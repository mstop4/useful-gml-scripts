event_inherited();
var _x = x + cursor_padding;
var _y = y;

for (var i=view_area.x; i<=view_area.y; i++) {
	var _item = items[| i];
	self.menu_base_draw_item(_item, _x, _y);
	_y += item_height + line_spacing;
}

if (enabled) {
	draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * (pos - view_area.x) + item_height / 2);
	if (view_height >= 1) {
		if (view_area.x > 0) draw_sprite(view_scroll_arrows_spr, 0, view_scroll_arrows_x, y - view_scroll_arrows_margin);
		if (view_area.y < num_items - 1) draw_sprite_ext(view_scroll_arrows_spr, 0, view_scroll_arrows_x, _y + view_scroll_arrows_margin, 1, -1, 0, c_white, 1);
	}
}
draw_set_alpha(1);