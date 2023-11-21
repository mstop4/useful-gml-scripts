reflector_angle = new Tween(0, 0.1, 0, 360, TWEEN_LIMIT_MODE.WRAP, false, pointer_null);
reflector = new LineSegment(0, 0, 0, 0);
reflector.a.x = x + dcos(reflector_angle.v) * reflector_half_length;
reflector.a.y = y - dsin(reflector_angle.v) * reflector_half_length;
reflector.b.x = x + dcos(reflector_angle.v) * -reflector_half_length;
reflector.b.y = y - dsin(reflector_angle.v) * -reflector_half_length;

can_reflect = false;
laser = new LineSegment(room_width/2, 0, room_width/2, room_height);
reflected_laser = new LineSegment(0, 0, 0, 0);
laser_reflect_angle = 0;

room_bb = new Rectangle(0, 0, room_width, room_height);