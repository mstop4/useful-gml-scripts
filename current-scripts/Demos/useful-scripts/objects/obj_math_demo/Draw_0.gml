draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Math Demo");

draw_set_halign(fa_left);
draw_text(16, 64, "Vectors");
draw_text(16, 176, "Normalized Vectors");
draw_text(640, 64, "Cross Products");
draw_text(640, 176, "Normalized Cross Product");

draw_text(16, 256, "Pulse");
draw_sprite_ext(spr_meter, 0, 16, 288, 0.25, 0.25, 0, c_gray, 1);
draw_sprite_ext(spr_meter, 0, 16, 288, 0.25, 0.25, 0, $80FFFF, pulse_t);

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