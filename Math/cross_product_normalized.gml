/// @func  cross_product_normalized(x1, y1, z1, x2, y2, z2)
/// @arg   x1 
/// @arg   y1
/// @arg   z1
/// @arg   x2
/// @arg   y2
/// @arg   z2

var _x1 = argument[0];
var _y1 = argument[1];
var _z1 = argument[2];
var _x2 = argument[3];
var _y2 = argument[4];
var _z2 = argument[5];

var _x3 = _y1*_z2 - _z1*_y2;
var _y3 = _z1*_x2 - _x1*_z2;
var _z3 = _x1*_y2 - _y1*_x2;

var _len3 = point_distance_3d(0,_x3,0,_y3,0,_z3);

return [_x3 / _len3, _y3 / _len3, _z3 / _len3];
