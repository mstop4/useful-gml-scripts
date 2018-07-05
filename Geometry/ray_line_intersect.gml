/// @param origin_x
/// @param origin_y
/// @param target_x
/// @param target_y
/// @param A_x
/// @param A_y
/// @param B_x
/// @param B_y

var _origin_x = argument[0];
var _origin_y = argument[1];
var _tar_x = argument[2];
var _tar_y = argument[3];
var _ax = argument[4];
var _ay = argument[5];
var _bx = argument[6];
var _by = argument[7];

var ray_dir = point_direction(_origin_x, _origin_y, _tar_x, _tar_y);

var v1x = _origin_x - _ax;
var v1y = _origin_y - _ay;
var v2x = _bx - _ax;
var v2y = _by - _ay;
var v3x = -lengthdir_y(1,ray_dir);
var v3y = lengthdir_x(1,ray_dir);

var dot = dot_product(v2x,v2y,v3x,v3y);

if (abs(dot) == 0)
	return -1;
	
var t1 = cross_product_2d(v2x, v2y, v1x, v1y) / dot;
var t2 = dot_product(v1x, v1y, v3x, v3y) / dot;

if (t1 >= 0 && (t2 >= 0 && t2 <= 1))
	return t1;

return -1;