for (var i=0; i<num_menu_items; i++) {
	draw_text(x + cursor_width + cursor_padding, y + (item_height + line_spacing) * i, menu_items[| i].label);
}

draw_sprite(cursor_spr, 0, x, y + (item_height + line_spacing) * menu_pos);