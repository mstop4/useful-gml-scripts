event_inherited();
var _x = x + cursor_padding;

for (var i=view_area.x; i<=view_area.y; i++) {
	var _item = items[| i];
	var _y = y + (item_height + line_spacing) * (i - view_area.x);

	self.menu_base_draw_item(_item, _x, _y);
}

if (enabled) {
	draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * (pos - view_area.x) + item_height / 2);
}
draw_set_alpha(1);