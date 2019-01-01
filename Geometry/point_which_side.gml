/// @func  point_which_side(Ax, Ay, Bx, By, Px, Py)
/// @desc return which side of a line segment AB a point P is on

// 0 = on the line
// < 0 = below or left
// > 0 = above or right

/// @arg Ax
/// @arg Ay
/// @arg Bx
/// @arg By
/// @arg Px
/// @arg Py

var _ax = argument[0];
var _ay = argument[1];
var _bx = argument[2];
var _by = argument[3];
var _px = argument[4];
var _py = argument[5];

return (_px - _ax) * (_by - _ay) - (_py - _ay) * (_bx - _ax);