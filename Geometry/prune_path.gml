/// @func  prune_path(path)
/// @arg   path 

var _path = argument[0];
var _num_points = path_get_number(_path);
var _cur_x, _cur_y, _next_x, _next_y;

if (_num_points == 1)
	return;


_cur_x = path_get_x(_path,0);
_cur_y = path_get_y(_path,0); 

for (var i=1; i<_num_points; i++) {
	_next_x = path_get_x(_path,i);
	_next_y = path_get_y(_path,i); 
	
	if (!collision_line(_cur_x,_cur_y,_next_x,_next_y,obj_wall,false,true)) {
		if (i <_num_points-1)
			path_delete_point(_path,i);
	}
	
	else {
		_cur_x = _next_x;
		_cur_y = _next_y;
	}
}