draw_set_font(fnt_title);
draw_text(16, 16, "Delta Time Alarm Demo (deprecated)");

draw_set_font(fnt_demo);
draw_text(16, 48, "(Use built-in Time Sources instead)");
draw_text(16, 96, "FPS: " + string(fps));
draw_text(16, 128, "Game Speed: " + string(room_speed));
draw_text(16, 160, "Time between fireworks: " + string(last_time_interval) + " ms");