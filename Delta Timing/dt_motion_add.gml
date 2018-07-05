/// @arg direction
/// @arg amount

var _direction = argument[0];
var _amount = argument[1];

x_speed = x_speed + lengthdir_x(_amount, _direction) * dt_scale;
y_speed = y_speed + lengthdir_y(_amount, _direction) * dt_scale;

// cap speed
var ratio = point_distance(0,0,x_speed,y_speed) / max_speed;
if (ratio > 1) {
	x_speed /= ratio;
	y_speed /= ratio;
}