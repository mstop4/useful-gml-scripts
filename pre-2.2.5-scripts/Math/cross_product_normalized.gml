/// @func  cross_product(vec1, vec2)
/// @arg   vec1 
/// @arg   vec2

var _vec1 = argument[0];
var _vec2 = argument[1];

var _x1 = _vec1[0];
var _y1 = _vec1[1];
var _z1 = _vec1[2];
var _x2 = _vec2[0];
var _y2 = _vec2[1];
var _z2 = _vec1[2];

var _x3 = _y1*_z2 - _z1*_y2;
var _y3 = _z1*_x2 - _x1*_z2;
var _z3 = _x1*_y2 - _y1*_x2;

var _len3 = point_distance_3d(0,_x3,0,_y3,0,_z3);

return [_x3 / _len3, _y3 / _len3, _z3 / _len3];
