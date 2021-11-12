draw_set_font(font_index);
draw_set_valign(v_align);
draw_set_halign(h_align);
draw_text_transformed_colour(
	x, y,
	value,
	image_xscale, image_yscale,
	image_angle,
	image_blend, image_blend, image_blend, image_blend,
	image_alpha
);