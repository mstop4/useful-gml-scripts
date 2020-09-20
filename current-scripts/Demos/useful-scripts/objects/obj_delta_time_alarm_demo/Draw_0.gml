draw_set_font(fnt_title);
draw_text(16, 16, "Delta Time Alarm Demo");

draw_set_font(fnt_demo);
draw_text(16, 64, "FPS: " + string(fps));
draw_text(16, 96, "Game Speed: " + string(room_speed));
draw_text(16, 128, "Time between fireworks: " + string(last_time_interval) + " ms");