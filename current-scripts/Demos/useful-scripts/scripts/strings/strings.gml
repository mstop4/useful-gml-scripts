/// @func      concat(val1[, val2, ...])
/// @desc      Concatenates a bunch of arguments into a string
/// @param {any} _value1
/// @param {any} [_value2]
/// ...
function concat() {
	var _str = "";

	for (var _i=0; _i<argument_count; _i++) {
		_str += string(argument[_i]);
	}

	return _str;
}


/// @func         dialogue_line_breaker(str, max_width, font)
/// @desc         Formats a long string so that it doesn't exceed max_width
/// @arg {string} _str        
/// @arg {real}   _max_width 
/// @arg {Asset.GMFont}   _font       
function dialogue_line_breaker(_str, _max_width, _font) {
	var _old_font = draw_get_font();
	draw_set_font(_font);
    
	// check to see if the string is already short enough to fit on one line.
	if (string_width(_str) <= _max_width)
		return _str;
    
	var _out_str = "";
	var _in_str_len = string_length(_str);
	var _line_buffer = "";
	var _word_buffer = "";
	var _cur_char = "";
    
	// break up string into lines
	for (var _i=1; _i<=_in_str_len; _i++) {
	  _cur_char = string_char_at(_str,_i);
        
	  // manual line break
	  if (_cur_char == "\n") {
		  // if current line is too long, break it
		  if (string_width(_line_buffer + _word_buffer) > _max_width) {
		    _out_str += _line_buffer + "\n" + _word_buffer + "\n";
			} else {
		    _out_str += _line_buffer + _word_buffer + "\n";
			}
            
		  _line_buffer = "";
		  _word_buffer = "";
	  } else if (_cur_char == " ") { // space
			if (string_width(_line_buffer + _word_buffer + _cur_char) > _max_width) {
	      _out_str += _line_buffer + _word_buffer + "\n";
	      _line_buffer = "";
	      _word_buffer = "";
	    } else {
	      _line_buffer += _word_buffer + _cur_char;
	      _word_buffer = "";
	    }    
	  } else { // others
	    if (string_width(_line_buffer + _word_buffer + _cur_char) > _max_width) {
	      _out_str += _line_buffer + "\n";
	      _line_buffer = "";
	      _word_buffer += _cur_char;
	    } else {
	      _word_buffer += _cur_char;
	    }   
	  }
        
	  // end of line
	  if (_i == _in_str_len) {
	    _out_str += _line_buffer + _word_buffer;
	  }
	}

	draw_set_font(_old_font);

	return _out_str;
}

/// @desc          Splits string into substrings.
///								 Deprecated: Use string_split instead.
/// @deprecated
/// @arg {string}  _str
/// @arg {string}  _delimiter
function split_string(_str, _delimiter) {
	var _substrings = [];
	var _str_len = string_length(_str);
	var _buffer = "";
	
	for (var _i=1; _i<=_str_len; _i++) {
		var _char = string_char_at(_str, _i);
		if (_char == _delimiter) {
			array_push(_substrings, _buffer);
			_buffer = "";
		} else {
			_buffer += _char;
		}
	}
	
	array_push(_substrings, _buffer);
	return _substrings;
}

/// @func          pad_string_width(str, char, position, width)
/// @desc          Pads a string with char until it is a certain width (in pixels)
/// @arg {string}  _str
/// @arg {string}  _char
/// @arg {real}		 _position
/// @arg {real}    _width
function pad_string_width(_str, _char, _position, _width) {
	while (string_width(_str + _char) < _width) {
		_str = string_insert(_char, _str, _position);
	}

	return _str;
}

/// @func          pad_string_width(str, char, position, width)
/// @desc          Pads a string with char until it is a certain length (in characters)
/// @arg {string}  _str
/// @arg {string}  _char
/// @arg {real}		 _position
/// @arg {real}    _width
function pad_string_length(_str, _char, _position, _width) {
	while (string_length(_str + _char) <= _width) {
		_str = string_insert(_char, _str, _position);
	}

	return _str;
}

/// @func         hide_overflow(string, suffix, font, max_width)
/// @desc					Hides overflowing text
/// @arg {string}				 _string
/// @arg {string}				 _suffix
/// @arg {Asset.GMFont}  _font
/// @arg {real}					 _max_width
function hide_overflow(_string, _suffix, _font, _max_width) {
	var _cur_font = draw_get_font();
	var _cur_str = _suffix;
	var _prev_str = _suffix;
	var _str_len = string_length(_string);
	var _index = 1;
	
	while (string_width(_cur_str) <= _max_width && _index <= _str_len) {
		_prev_str = _cur_str;
		_cur_str = string_insert(string_char_at(_string, _index), _cur_str, _index);
		_index++;
	}
	
	draw_set_font(_cur_font);
	return _index <= _str_len ? _prev_str : _string;
}