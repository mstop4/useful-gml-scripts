draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_text(room_width/2, 16, "Web Demo");

draw_text(room_width/2, 128, "Original URL:");
draw_text(room_width/2, 192, "Encoded URL:");
draw_text(room_width/2, room_height/2, "Click anywhere to enter a URL");

draw_set_font(fnt_url);
draw_text(room_width/2, 160, original_url);
draw_text(room_width/2, 224, encoded_url);