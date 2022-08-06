draw_set_colour(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(16, 16, "Useful GML Script Demos");

draw_set_font(fnt_demo);
draw_text(640, 16, "OS Type: " + os_type_str);
draw_text(640, 48, "OS Version: " + os_version_str);
draw_text(640, 80, "Browser: " + os_browser_str);
draw_text(640, 112, "Connected to Network: " + (os_is_network_connected() ? "Yes" : "No"));
draw_text(640, 144, "Language: " + os_language);
draw_text(640, 176, "Region: " + os_region);
