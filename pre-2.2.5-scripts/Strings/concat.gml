/// @func concat(str1[,str2...])

var _str = "";

for (var i=0; i<argument_count; i++)
{
	_str += string(argument[i]);
}

return _str;