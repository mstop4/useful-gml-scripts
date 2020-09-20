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
	reflected_laser.b.x = _laser_reflect_point.x + lengthdir_x(1, laser_reflect_angle);
	reflected_laser.b.y = _laser_reflect_point.y + lengthdir_y(1, laser_reflect_angle);
	
	var _edge_pos = get_edge_position(reflected_laser, room_bb);
	reflected_laser.b.x = _edge_pos.x;
	reflected_laser.b.y = _edge_pos.y;
} else {
	can_reflect = false;
}