draw_set_color(c_white);
draw_line(limit_min, y-16, limit_min, y+224);
draw_line(limit_max, y-16, limit_max, y+224);

draw_set_color(c_gray);
draw_line(actual_min, y-16, actual_min, y+224);
draw_line(actual_max, y-16, actual_max, y+224);

draw_set_color(c_white);
draw_set_font(fnt_demo);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(16, y, "Raw");
draw_circle(actual_xpos.v, y, 16, false);

draw_set_color($8080FF);
draw_text(16, y+48, "Soft Clamp");
draw_circle(soft_clamp_xpos, y+48, 16, false);

draw_set_color($80FFFF);
draw_text(16, y+80, "Soft Ceiling");
draw_circle(soft_ceiling_xpos, y+80, 16, false);

draw_set_color($80FF80);
draw_text(16, y+112, "Soft Floor");
draw_circle(soft_floor_xpos, y+112, 16, false);

draw_set_color($FFFF80);
draw_text(16, y+160, "Clamp");
draw_circle(clamp_xpos, y+160, 16, false);

draw_set_color($FF8080);
draw_text(16, y+192, "Min");
draw_circle(min_xpos, y+192, 16, false);

draw_set_color($FF80FF);
draw_text(16, y+224, "Max");
draw_circle(max_xpos, y+224, 16, false);