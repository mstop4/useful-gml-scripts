/// @func      print(value1[,value2,...])
/// @desc      Syntactic sugar for show_debug_message
/// @param {any} _value1
/// @param {any} [value2]
/// ...
function print(_value1) {
	var _str = "";

	for (var _i=0; _i<argument_count; _i++) {
		_str += string(argument[_i]);
	}

	show_debug_message(_str);
}