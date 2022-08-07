draw_set_colour(c_white);
draw_set_font(fnt_title);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(16, 16, "System Info");
if (os_type == os_linux) {
	draw_text(16, 272, "Linux Info (for debugging Steam Deck stuff)");
}

draw_set_font(fnt_demo);
draw_text(16, 48, "OS Type: " + os_type_str);
draw_text(16, 80, "OS Version: " + os_version_str);
draw_text(16, 112, "Browser: " + os_browser_str);
draw_text(16, 144, "Connected to Network: " + (os_is_network_connected() ? "Yes" : "No"));
draw_text(16, 176, "Language: " + os_language);
draw_text(16, 208, "Region: " + os_region);

if (os_type == os_linux) {
	draw_text(16, 304, "Vendor: " + gl_vendor);
	draw_text(16, 336, "Version: " + gl_version);
	draw_text(16, 368, "Renderer: " + gl_renderer);
	draw_text(16, 400, "Is On Steam Deck: " + (steam_deck_info.is_on_steam_deck ? "Yes" : "No"));
	draw_text(16, 432, "Steam Deck Gamepad Index: " + string(steam_deck_info.gamepad_index));
}