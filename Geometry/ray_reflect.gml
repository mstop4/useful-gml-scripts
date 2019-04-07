/// @function ray_reflect(incident_dir, normal_dir)
/// @desc Rr = Ri - 2 * N * (Ri . N)
/// @argument incident_dir
/// @argument normal_dir

var _ri_x = lengthdir_x(1,argument[0]);
var _ri_y = lengthdir_y(1,argument[0]);
var _n_x = lengthdir_x(1,argument[1]);
var _n_y = lengthdir_y(1,argument[1]);

var _dot = dot_product(_ri_x,_ri_y,_n_x,_n_y);
var _reflect_x = _ri_x - 2 * _n_x * _dot;
var _reflect_y = _ri_y - 2 * _n_y * _dot;

return point_direction(0,0,_reflect_x,_reflect_y);