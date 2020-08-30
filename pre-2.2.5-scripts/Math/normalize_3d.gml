/// @func  normalize_3d(x, y, z)
/// @arg   x
/// @arg   y
/// @arg   z

var _x = argument[0];
var _y = argument[1];
var _z = argument[2];

var _len = point_distance_3d(0,_x,0,_y,0,_z);

return [_x / _len, _y / _len, _z / _len];