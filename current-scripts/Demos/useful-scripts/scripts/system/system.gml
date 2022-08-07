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

/// @func get_os_type_string(os_type)
/// @desc Converts os_type enum value into a human-readable string
/// @param {number} os_type
/// @returns {string}
function get_os_type_string(_os_type){
	if (_os_type >= 0 && _os_type < array_length(global._os_type_strings)) {
		return global._os_type_strings[_os_type];
	} else {
		return "Unknown OS";
	}
}

/// @func get_os_version_string(os_version)
/// @desc Converts os_version into a human-readable string
/// @param {number} os_version
/// @returns {string}
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

/// @func get_os_browser_string(os_version)
/// @desc Converts os_browser enum value into a human-readable string
/// @param {number} os_browser
/// @returns {string}
function get_os_browser_string(_os_browser) {
	if (_os_browser == browser_not_a_browser) {
		return "Not a browser";
	} else if (_os_browser >= 0 && _os_browser < array_length(global._os_browser_strings)) {
		return global._os_browser_strings[_os_browser];
	} else {
		return global._os_browser_strings[browser_unknown];
	}
}

/// @func get_steam_deck_info()
/// @desc Checks if game is running on Steam Deck and which gamepad slot the controls are connected to
/// Note: Doesn't work if called at the very start of the game. Wait a few steps before calling it.
/// @returns {boolean}
function get_steam_deck_info() {
	var _result = {
		is_on_steam_deck: false,
		gamepad_index: -1,
	}
	
	// Check all gamepad slots for "Valve Streaming Controller"
	var _num_devices = gamepad_get_device_count();
  for (var i = 0; i < _num_devices; i++;) {
    if (gamepad_is_connected(i)) {
      var _description = gamepad_get_description(i);
      if (string_pos("Valve Streaming Gamepad", _description) != 0) {
        _result.gamepad_index = i;
      }
    }
  }
	
	// Check Device Info to see if it matches Steam Deck hardware
	var _os_info = os_get_info();
	
	// No info found, return early
	if (_os_info == -1) return _result;
  var _vendor = _os_info[? "gl_vendor_string"];
  var _version = _os_info[? "gl_version_string"];	
  var _renderer = _os_info[? "gl_renderer_string"];
	
  // Vendor should be "AMD"
  // Version should contain "Mesa"
	// Renderer should be "AMD Custom GPU 0405"
  if ( _result.gamepad_index >= 0
		&& string_pos("AMD", _vendor) != 0
		&& string_pos("Mesa", _version) != 0
    && string_pos("AMD Custom GPU 0405", _renderer) != 0) {
    _result.is_on_steam_deck = true;
  }
	
	ds_map_destroy(_os_info);
	return _result;
}