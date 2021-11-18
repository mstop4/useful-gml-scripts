draw_set_font(fnt_title);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Math Demo");

draw_set_halign(fa_left);
draw_text(16, 64, "Vectors");
draw_text(16, 176, "Normalized Vectors");
draw_text(16, 384, "Soft Limiters");
draw_text(640, 64, "Cross Products");
draw_text(640, 176, "Normalized Cross Product");

draw_text(16, 256, "Pulse");
draw_sprite_ext(spr_meter, 0, 16, 288, 0.25, 0.25, 0, c_gray, 1);
draw_sprite_ext(spr_meter, 0, 16, 288, 0.25, 0.25, 0, $80FFFF, pulse_t);

draw_text(640, 256, "Vector Operations");

draw_text(640, 368, "Wrap");
draw_text(640, 448, "Blin");

draw_set_font(fnt_demo);
// Vectors
draw_text(16, 96, "a = " + vec_A.to_string());
draw_text(16, 128, "b = " + vec_B.to_string());
draw_text(144, 96, "c = " + vec_C.to_string());
draw_text(144, 128, "d = " + vec_D.to_string());

// Normalized Vectors
draw_text(16, 208, "â = " + normalize_2d(vec_A).to_string());
draw_text(192, 208, "ĉ = " + normalize_3d(vec_C).to_string());

// Cross Products
draw_text(640, 96, "a x b = " + string(cross_product_2d(vec_A, vec_B)) + " (Z-component)");
draw_text(640, 128, "c x d = " + cross_product(vec_C, vec_D).to_string());

// Normalized Cross Products
draw_text(640, 208, "c x d / |c x d| = " + cross_product_normalized(vec_C, vec_D).to_string());

// Pulse
draw_text(96, 288, "t: " + string(pulse_counter.v));
draw_text(176, 288, "p(t): " + string(pulse_t));

// Vector Operations
draw_text(640, 288, "a + b = " + string(vec_A.add(vec_B).to_string()));
draw_text(640, 320, "c - d = " + string(vec_C.subtract(vec_D).to_string()));

// Wrap
draw_text(640, 400, "t: " + string(wrap_counter.v));
draw_text(720, 400, "w(t): " + string(wrapped_value));

// Blin
for (var i=0; i<5; i++) {
	for (var j=0; j<5; j++) {
		draw_text(640 + i*64, 480 + j*32, string(blin_values[# i, j]));
	}
}