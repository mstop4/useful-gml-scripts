// System Info
os_type_str = get_os_type_string(os_type);
os_version_str = get_os_version_string(os_version);
os_browser_str = get_os_browser_string(os_browser);
os_language = os_get_language();
os_region = os_get_region();

// Used for debugging Steam Deck detection
os_info = -1;
gl_vendor = "";
gl_version = "";
gl_renderer = "";
steam_deck_info = -1;

if (os_type == os_linux) {
	os_info = os_get_info();

	if (os_info != -1) {
		gl_vendor = os_info[? "gl_vendor_string"];
		gl_version = os_info[? "gl_version_string"];
		gl_renderer = os_info[? "gl_renderer_string"];
	}
	
	ds_map_destroy(os_info);
	
	// Feather disable once GM1043
	steam_deck_info = get_steam_deck_info();
}