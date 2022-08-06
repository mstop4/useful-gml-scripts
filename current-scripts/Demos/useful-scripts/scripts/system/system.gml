global._os_type_strings = [];
global._os_type_strings[os_windows] = "Windows";
global._os_type_strings[os_uwp] = "Universal Windows Platform";
global._os_type_strings[os_operagx] = "Opera GX";
global._os_type_strings[os_linux] = "Linux";
global._os_type_strings[os_macosx] = "macOS";
global._os_type_strings[os_ios] = "iOS";
global._os_type_strings[os_tvos] = "Apple tvOS";
global._os_type_strings[os_android] = "Android";
global._os_type_strings[os_ps4] = "PlayStation 4";
global._os_type_strings[os_ps5] = "PlayStation 5";
global._os_type_strings[os_xboxone] = "Xbox One";
global._os_type_strings[os_xboxseriesxs] = "Xbox Series X/S";
global._os_type_strings[os_switch] = "Nintendo Switch";

global._os_browser_strings = [];
global._os_browser_strings[browser_unknown] = "Unknown Browser";
global._os_browser_strings[browser_ie] = "Internet Explorer";
global._os_browser_strings[browser_ie_mobile] = "Mobile Internet Explorer";
global._os_browser_strings[browser_firefox] = "Firefox";
global._os_browser_strings[browser_chrome] = "Chrome";
global._os_browser_strings[browser_safari] = "Safari";
global._os_browser_strings[browser_safari_mobile] = "Mobile Safari";
global._os_browser_strings[browser_opera] = "Opera";
global._os_browser_strings[browser_tizen] = "Tizen";
global._os_browser_strings[browser_windows_store] = "Windows App";

function get_os_type_string(_os_type){
	if (_os_type >= 0 && _os_type < array_length(global._os_type_strings)) {
		return global._os_type_strings[_os_type];
	} else {
		return "Unknown OS";
	}
}

function get_os_version_string(_os_version) {
	// Browser
	if (os_browser != browser_not_a_browser || os_type == os_operagx) {
		return "N/A";
	}
	
	// Windows
	if (os_type == os_windows) {
		var _major_v = _os_version >> 16;
		var _minor_v = _os_version & 65535;
		return string(_major_v) + "." + string(_minor_v);
	}
	
	// macOS and iOS
	if (os_type == os_macosx || os_type == os_ios) {
		var _major_v = _os_version >> 24;
		var _minor_v = (_os_version >> 12) & 4095;
		var _build = _os_version & 4095;
		return string(_major_v) + "." + string(_minor_v) + "." + string(_build);
	}
	
	// All other cases (including unknown platform)
	return string(_os_version);
}

function get_os_browser_string(_os_browser) {
	if (_os_browser == browser_not_a_browser) {
		return "Not a browser";
	} else if (_os_browser >= 0 && _os_browser < array_length(global._os_browser_strings)) {
		return global._os_browser_strings[_os_browser];
	} else {
		return global._os_browser_strings[browser_unknown];
	}
}