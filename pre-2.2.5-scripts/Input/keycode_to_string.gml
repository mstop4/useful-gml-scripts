/// @func  keycode_to_string(keycode)
/// @desc  converts keycode to name of key as a string
/// @arg   keycode 

var _keycode = argument[0];

{
    // alphanumeric
    if ((_keycode >= ord("0") && _keycode <= ord("9")) || (_keycode >= ord("A") && _keycode <= ord("Z")))
        return string(chr(_keycode));
        
    else
    {
        switch (_keycode)
        {
            case vk_backspace:
                return "BCKSP";
            case vk_enter:
                return "ENTER";
            case vk_lshift:
                return "LSHFT";
            case vk_lcontrol:
                return "LCTRL";
            case vk_lalt:
                return "LALT";
            case vk_rshift:
                return "RSHFT";
            case vk_rcontrol:
                return "RCTRL";
            case vk_ralt:
                return "RALT";
            case vk_pause:
                return "PAUSE";
            case vk_space:
                return "SPACE";
            case vk_pageup:
                return "PGUP";
            case vk_pagedown:
                return "PGDN";
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
                return "INS";
            case vk_delete:
                return "DEL";
            case vk_printscreen:
                return "PTSCN";
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
                
            case 186:
                return ";";
            case 187:
                return "=";
            case 188:
                return ",";
            case 189:
                return "-";
            case 190:
                return ".";
            case 191:
                return "/";
            case 192:
                return "`";
            case 219:
                return "[";
            case 220:
                return "\\";
            case 221:
                return "]";
            case 222:
                return "'";
                
            case vk_nokey:
                return "_";
            default:
                return "???";
        }
    }
}