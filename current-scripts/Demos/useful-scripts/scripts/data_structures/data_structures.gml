/// @func         grids_are_equal(grid1, grid2)
/// @desc         Compares all cells of two DS Grids for equality
/// @param {Grid} grid1
/// @param {Grid} grid2

function grids_are_equal(_grid1, _grid2) {
	return ds_grid_write(_grid1) == ds_grid_write(_grid2);
}

/// @func          choose_from_array(array)
/// @desc					 Chooses a random element from an array
/// @param {Array} array
function choose_from_array(_array) {
	return _array[irandom(array_length(_array)-1)];
}

/// @func          array_is_subset(array)
/// @desc					 Checks if Array a is a subset of array b
/// @param {Array} a
/// @param {Array} b
function array_is_subset(_a, _b) {
	var _a_len = array_length(_a);
	var _b_len = array_length(_b);
	if (_a_len > _b_len) return false;

	var _match = false;
	
	for (var i=0; i<_a_len; i++) {
		_match = false;
		for (var j=0; j<_b_len; j++) {
			if (_a[i] == _b[i]) {
				_match = true;
				break;
			}
		}
		
		if (!_match) return false;
	}
	
	return true;
}

/// @func duplicate_array(array)
/// @desc Creates a new copy of a given array
/// @param {Array} array
function duplicate_array(_array) {
	var _new_array = array_create(array_length(_array));
	array_copy(_new_array, 0, _array, 0, array_length(_array));
	return _new_array;
}

function shuffle_array(_array) {
  var _current_index = array_length(_array);
	var _random_index;

  // While there remain elements to shuffle
  while (_current_index != 0) {
    // Pick a remaining element
    _random_index = irandom(_current_index - 1);
    _current_index--;

    // And swap it with the current element
		var _temp = _array[_current_index];
		_array[_current_index] = _array[_random_index];
		_array[_random_index] = _temp;
  }

  return _array;
}

/// @func          file_jsonc_parse(filename)
/// @desc					 Parses a JSON with Comments from file, stripping out the comments
/// @param {Array} filename
function file_jsonc_parse(_filename) {
	var _jsonc_file = file_text_open_read(_filename);
	if (_jsonc_file == -1) return {};
	
	var _json_str = "";
	var _is_in_multiline_comment = false;
	
	while (!file_text_eof(_jsonc_file)) {
		var _line = file_text_readln(_jsonc_file);
		
		// Strip comments
		if (!_is_in_multiline_comment) {
			var _single_line_comment_pos = string_pos("\/\/", _line);
			var _multi_line_comment_start_pos = string_pos("\/*", _line);
			var _new_line = _line;
			
			if (_single_line_comment_pos != 0
				&& (_multi_line_comment_start_pos == 0 || _single_line_comment_pos < _multi_line_comment_start_pos)) {
				// Single-line comment
				_new_line = string_copy(_line, 1, _single_line_comment_pos-1);
			} else if (_multi_line_comment_start_pos != 0) {
				// Start of multi-line comment
				_new_line = string_copy(_line, 1, _multi_line_comment_start_pos-1);
				
				// Does it end on the same line?
				var _multi_line_comment_end_pos = string_pos("*\/", _line);
				if (_multi_line_comment_end_pos != 0 && _multi_line_comment_end_pos > _multi_line_comment_start_pos) {
					var _str_len = string_length(_line);
					var _length_left = _str_len - (_multi_line_comment_end_pos+1);
					_new_line += string_copy(_line, _multi_line_comment_end_pos+2, _length_left);
				} else {
					_is_in_multiline_comment = true;
				}
			}
				
			_json_str += _new_line;
		} else {
			var _multi_line_comment_end_pos = string_pos("*\/", _line);

			if (_multi_line_comment_end_pos != 0) {
				var _str_len = string_length(_line);
				var _length_left = _str_len - (_multi_line_comment_end_pos+1);
				var _new_line = string_copy(_line, _multi_line_comment_end_pos+2, _length_left);
				_is_in_multiline_comment = false;
				_json_str += _new_line;
			}
		}
	}
	
	file_text_close(_jsonc_file);
	
	return json_parse(_json_str);
}