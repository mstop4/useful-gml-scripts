reflector_angle.update();

reflector.a.x = x + dcos(reflector_angle.v) * reflector_half_length;
reflector.a.y = y - dsin(reflector_angle.v) * reflector_half_length;
reflector.b.x = x + dcos(reflector_angle.v) * -reflector_half_length;
reflector.b.y = y - dsin(reflector_angle.v) * -reflector_half_length;

var _laser_reflect_point = ray_line_intersect(laser, reflector);
laser_reflect_angle = ray_reflect(
	point_direction(laser.a.x, laser.a.y, laser.b.x, laser.b.y),
	reflector_angle.v - 90
);

if (_laser_reflect_point != -1) {
	can_reflect = true;
	reflected_laser.a.x = _laser_reflect_point.x;
	reflected_laser.a.y = _laser_reflect_point.y;
	reflected_laser.b.x = _laser_reflect_point.x + lengthdir_x(reflect_laser_length, laser_reflect_angle);
	reflected_laser.b.y = _laser_reflect_point.y + lengthdir_y(reflect_laser_length, laser_reflect_angle);
} else {
	can_reflect = false;
}