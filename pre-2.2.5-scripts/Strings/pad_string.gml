/// @arg init_str
/// @arg char
/// @arg position
/// @arg width

var _init_str = argument[0];
var _char = argument[1];
var _position = argument[2];
var _width = argument[3]; 

while (string_width(_init_str + _char) < _width) {
	_init_str = string_insert(_char,_init_str,_position);
}

return _init_str;