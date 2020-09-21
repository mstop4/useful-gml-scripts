/// @func      print(value1[,value2,...])
/// @desc      Syntactic sugar for show_debug_message
/// @param {*} value1
/// @param {*} [value2]
/// ...
function print(_value1) {
	var _str = "";

	for (var i=0; i<argument_count; i++) {
		_str += string(argument[i]);
	}

	show_debug_message(_str);
}