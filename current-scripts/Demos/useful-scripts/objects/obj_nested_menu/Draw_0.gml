event_inherited();
var _x = x + cursor_padding;

for (var i=0; i<num_items; i++) {
	var _item = items[| i];
	var _y = y + (item_height + line_spacing) * i;
	draw_text(_x, _y, _item.label);
}

if (enabled) {
	draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * pos + item_height / 2);
}
draw_set_alpha(1);