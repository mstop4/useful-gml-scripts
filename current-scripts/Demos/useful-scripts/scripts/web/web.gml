/// @func           url_encode(url)
/// @desc           URL-Encodes a string according to RFC 1738. Based on https://help.yoyogames.com/hc/en-us/articles/216754718-Encoding-URLs
/// @param {string} _url
function url_encode(_url) {
	var _encoded_url = "";
	
	var _url_len = string_length(_url);
	var _special_chars = [
		"$", "&", "+", ",", 
		"/", ":", ";", "=",
		"?", "@", " ", "\"",
		"<", ">", "#", "%",
		"{", "}", "|", "\\",
		"^", "~", "[", "]", "`"
	];
	var _num_special_chars = array_length(_special_chars);
	
	var _decimal_to_hex = [
		"0", "1", "2", "3",
		"4", "5", "6", "7",
		"8", "9", "A", "B",
		"C", "D", "E", "F"
	];
	
	for (var _i=1; _i<=_url_len; _i++) {
		var _char = ord(string_char_at(_url, _i));
		var _is_special = false;
		
		if (_char < ord(" ") || _char > ord("~")) {
			_is_special = true;
		}
		else {
			for (var _j=0; _j<_num_special_chars; _j++) {
				if (_char == ord(_special_chars[_j])) {
					_is_special = true;
					break;
				}
			}
		}
		
		if (_is_special) {
			var _high = _decimal_to_hex[_char div 16];
			var _low = _decimal_to_hex[_char mod 16];
			_encoded_url += "%" + _high + _low;
		} else {
			_encoded_url += chr(_char);
		}
	}
	
	return _encoded_url;
}