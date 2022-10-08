#macro vk_clear 12
#macro vk_caps_lock 20
#macro vk_left_command 91
#macro vk_right_command 92
#macro vk_menu 93
#macro vk_num_lock 144
#macro vk_scroll_lock 145
#macro vk_semicolon 186
#macro vk_equals 187
#macro vk_comma 188
#macro vk_hyphen 189
#macro vk_period 190
#macro vk_slash 191
#macro vk_backtick 192
#macro vk_left_bracket 219
#macro vk_backslash 220
#macro vk_right_bracket 221
#macro vk_single_quote 222

/// @func            keycode_to_string(keycode)
/// @desc            converts keycode to name of key as a string
/// @param {integer} keycode 
function keycode_to_string(_keycode) {
  // alphanumeric
  if ((_keycode >= ord("0") && _keycode <= ord("9")) || (_keycode >= ord("A") && _keycode <= ord("Z"))) {
      return string(chr(_keycode));
	} else {
    switch (_keycode) {
			case vk_tab:
				return "TAB";
      case vk_backspace:
        return "BACKSPACE";
      case vk_enter:
        return "ENTER";
			case vk_shift:
				return "SHIFT";
      case vk_lshift:
        return "LEFT SHIFT";
      case vk_rshift:
        return "RIGHT SHIFT";
			case vk_control:
				return "CTRL";
      case vk_lcontrol:
        return "LEFT CTRL";
      case vk_rcontrol:
        return "RIGHT CTRL";
			case vk_alt:
				return "ALT";
      case vk_lalt:
        return "LEFT ALT";
      case vk_ralt:
        return "RIGHT ALT";
      case vk_pause:
        return "PAUSE";
      case vk_space:
        return "SPACE";
      case vk_pageup:
        return "PAGE UP";
      case vk_pagedown:
        return "PAGE DOWN";
      case vk_end:
        return "END";
      case vk_home:
        return "HOME";
      case vk_left:
        return "←";
      case vk_up:
        return "↑";
      case vk_right:
        return "→";
      case vk_down:
        return "↓";
      case vk_insert:
        return "INSERT";
      case vk_delete:
        return "DELETE";
      case vk_printscreen:
        return "PRINT SCREEN";
      case vk_escape:
        return "ESC";
                
      case vk_numpad0:
        return "NUM 0";
      case vk_numpad1:
        return "NUM 1";
      case vk_numpad2:
        return "NUM 2";
      case vk_numpad3:
        return "NUM 3";
      case vk_numpad4:
        return "NUM 4";
      case vk_numpad5:
        return "NUM 5";
      case vk_numpad6:
        return "NUM 6";
      case vk_numpad7:
        return "NUM 7";
      case vk_numpad8:
        return "NUM 8";
      case vk_numpad9:
        return "NUM 9";
      case vk_multiply:
        return "NUM *";
      case vk_add:
        return "NUM +";
      case vk_subtract:
        return "NUM -";
      case vk_decimal:
        return "NUM .";
      case vk_divide:
        return "NUM /";
            
      case vk_f1:
        return "F1";
      case vk_f2:
        return "F2";
      case vk_f3:
        return "F3";
      case vk_f4:
        return "F4";
      case vk_f5:
        return "F5";
      case vk_f6:
        return "F6";
      case vk_f7:
        return "F7";
      case vk_f8:
        return "F8"; 
      case vk_f9:
        return "F9";
      case vk_f10:
        return "F10";
      case vk_f11:
        return "F11";
      case vk_f12:
        return "F12";
                
			case vk_clear:
				return "CLEAR";
			case vk_caps_lock:
				return "CAPS LOCK"
			case vk_left_command:
				return "LEFT WINDOWS/COMMAND";
			case vk_right_command:
				return "RIGHT WINDOWS/COMMAND";
			case vk_menu:
				return "MENU";
			case vk_num_lock:
				return "NUM LOCK";
			case vk_scroll_lock:
				return "SCROLL LOCK";
      case vk_semicolon:
        return ";";
      case vk_equals:
        return "=";
      case vk_comma:
        return ",";
      case vk_hyphen:
        return "-";
      case vk_period:
        return ".";
      case vk_slash:
        return "/";
      case vk_backtick:
        return "`";
      case vk_left_bracket:
        return "[";
      case vk_backslash:
        return "\\";
      case vk_right_bracket:
        return "]";
      case vk_single_quote:
				return "'";
                
      case vk_nokey:
				return "NO KEY";
      default:
				return "???";
    }
  }
}

/// @func            gamepad_constant_to_string(keycode)
/// @desc            converts gamepad constant to name as a string
/// @param {integer} gp_constant 
function gamepad_constant_to_string(_gp_constant) {
	 switch (_gp_constant) {
		case gp_padu:
			return "UP";
		case gp_padd:
			return "DOWN";
		case gp_padl:
			return "LEFT";
		case gp_padr:
			return "RIGHT";
		case gp_face1:
			return "A";
		case gp_face2:
			return "B";
		case gp_face3:
			return "X";
		case gp_face4:
			return "Y";
		case gp_shoulderl:
			return "LT";
		case gp_shoulderr:
			return "RT";
		case gp_shoulderlb:
			return "LB";
		case gp_shoulderrb:
			return "RB";
		case gp_stickl:
			return "LS";
		case gp_stickr:
			return "RS";
		case gp_select:
			return "SELECT";
		case gp_start:
			return "START";
			
    default:
			return "???";
	 }
}