/// @func              get_edge_position(instance, bounding_box)
/// @desc              Get the closest position of ans instance to the edge of rectangle
/// @param {Vector2}   position 
/// @param {Rectangle} bounding_box
function get_edge_position(_position, _bounding_box) {
	var _pos_to_bb_mid = new LineSegment(_position.x,
		_position.y,
		_bounding_box.left + _bounding_box.width()/2,
		_bounding_box.top + _bounding_box.height()/2
	);

	var _cur_t1 = -1;
	var _cur_dist;
	var _edge = new Vector2(0, 0);
	var _closest_dist = 1000000;
	var _closest_pos = new Vector3(-1, -1, -1);
			
	if (!point_in_rectangle(_position.x, _position.y,
		_bounding_box.left, _bounding_box.top,
		_bounding_box.right, _bounding_box.bottom)) {

		// left
		_cur_t1 = ray_line_intersect(_pos_to_bb_mid, _bounding_box.left_edge());
				
		if (_cur_t1 != -1) {
			_edge.x = _pos_to_bb_mid.b.x + lengthdir_x(_cur_t1, point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_edge.y = _pos_to_bb_mid.b.y + lengthdir_y(_cur_t1, point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_cur_dist = point_distance(_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y, _edge.x, _edge.y);
		
			if (_cur_dist < _closest_dist) {
				_closest_dist = _cur_dist;
				_closest_pos.x = _edge.x;
				_closest_pos.y = _edge.y;
				_closest_pos.z = point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y);
			}
		}
	
		// right
		_cur_t1 = ray_line_intersect(_pos_to_bb_mid, _bounding_box.right_edge());
				
		if (_cur_t1 != -1) {
			_edge.x = _pos_to_bb_mid.b.x + lengthdir_x(_cur_t1,point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_edge.y = _pos_to_bb_mid.b.y + lengthdir_y(_cur_t1,point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_cur_dist = point_distance(_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y, _edge.x, _edge.y);
		
			if (_cur_dist < _closest_dist) {
				_closest_dist = _cur_dist;
				_closest_pos.x = _edge.x;
				_closest_pos.y = _edge.y;
				_closest_pos.z = point_direction(_pos_to_bb_mid.b.x,_pos_to_bb_mid.b.y,_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y);
			}
		}
	
		// top
		_cur_t1 = ray_line_intersect(_pos_to_bb_mid, _bounding_box.top_edge());
				
		if (_cur_t1 != -1) {
			_edge.x = _pos_to_bb_mid.b.x + lengthdir_x(_cur_t1,point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_edge.y = _pos_to_bb_mid.b.y + lengthdir_y(_cur_t1,point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_cur_dist = point_distance(_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y, _edge.x, _edge.y);
		
			if (_cur_dist < _closest_dist) {
				_closest_dist = _cur_dist;
				_closest_pos.x = _edge.x;
				_closest_pos.y = _edge.y;
				_closest_pos.z = point_direction(_pos_to_bb_mid.b.x,_pos_to_bb_mid.b.y,_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y);
			}
		}
	
		// bottom
		_cur_t1 = ray_line_intersect(_pos_to_bb_mid, _bounding_box.bottom_edge());
				
		if (_cur_t1 != -1) {
			_edge.x = _pos_to_bb_mid.b.x + lengthdir_x(_cur_t1,point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_edge.y = _pos_to_bb_mid.b.y + lengthdir_y(_cur_t1,point_direction(_pos_to_bb_mid.b.x, _pos_to_bb_mid.b.y, _pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y));
			_cur_dist = point_distance(_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.gravity_direction, _edge.x, _edge.y);
		
			if (_cur_dist < _closest_dist) {
				_closest_dist = _cur_dist;
				_closest_pos.x = _edge.x;
				_closest_pos.y = _edge.y;
				_closest_pos.z = point_direction(_pos_to_bb_mid.b.x,_pos_to_bb_mid.b.y,_pos_to_bb_mid.a.x, _pos_to_bb_mid.a.y);
			}
		}
	}

	return _closest_pos;
}

/// @func                point_which_side(A, B, P)
/// @desc                Returns which side of a line segment AB a point P is on
///                      0 = on the line
///                      < 0 = below or left
///                      > 0 = above or right
/// @param {LineSegment} line
/// @param {Vector2}     P
function point_which_side(_line, _p) {
	return (_p.x - _line.a.x) * (_line.b.y - _line.y) - (_p.y - _line.a.y) * (_line.b.x - _line.a.x);
}

/// @func           prune_path(path)
/// @desc           Removes redundant points in a Path
/// @param {Path}   path
/// @param {Object} obstacle
function prune_path(_path, _obstacle) {
	var _num_points = path_get_number(_path);

	if (_num_points == 1)
		return;

	 var _cur = new Vector2(path_get_x(_path, 0), path_get_y(_path, 0));
	 var _next = new Vector2(0, 0);

	for (var i=1; i<_num_points; i++) {
		_next.x = path_get_x(_path, i);
		_next.y = path_get_y(_path, i); 
	
		if (!collision_line(_cur.x, _cur.y, _next.x, _next.y, _obstacle, false, true)) {
			if (i <_num_points-1)
				path_delete_point(_path,i);
		}
	
		else {
			_cur.x = _next.x;
			_cur.y = _next.y;
		}
	}
}


/// @func                 line_line_intersect(line1, line2)
/// @desc                 Finds the intersection point between two LineSegments
/// @param {LineSegement} line1
/// @param {LineSegement} line2
function ray_line_intersect(_line1, _line2) {
	var _ray_dir = point_direction(_line1.a.x, _line1.a.y, _line1.b.x, _line1.b.y);

	var _v1 = new Vector2(_line1.a.x - _line2.a.x, _line1.a.y - _line2.a.y);
	var _v2 = new Vector2(_line2.b.x - _line2.a.x, _line2.b.y - _line2.a.y);
	var _v3 = new Vector2(-lengthdir_y(1, _ray_dir), lengthdir_x(1, _ray_dir));

	var _dot = dot_product(_v2.x, _v2.y, _v3.x, _v3.y);

	if (abs(_dot) == 0)
		return -1;
	
	var _t1 = cross_product_2d(_v2, _v1) / _dot;
	var _t2 = dot_product(_v1.x, _v1.y, _v3.x, _v3.y) / _dot;

	if (_t1 >= 0 && (_t2 >= 0 && _t2 <= 1)) {
		var _unit_ray = new Vector2(lengthdir_x(1, _ray_dir), lengthdir_y(1, _ray_dir));
		return new Vector2(_line1.a.x + _unit_ray.x * _t1, _line1.a.y + _unit_ray.y * _t1);
	}

	return -1;
}

/// @func         ray_reflect(incident_dir, normal_dir)
/// @desc         Rr = Ri - 2 * N * (Ri . N)
/// @param {real} incident_dir
/// @param {real} normal_dir
function ray_reflect(_incident_dir, _normal_dir) {
	var _ri = new Vector2(lengthdir_x(1, _incident_dir), lengthdir_y(1, _incident_dir));
	var _n = new Vector2(lengthdir_x(1, _normal_dir), lengthdir_y(1, _normal_dir));

	var _dot = dot_product(_ri.x, _ri.y, _n.x, _n.y);
	var _reflect_x = _ri.x - 2 * _n.x * _dot;
	var _reflect_y = _ri.y - 2 * _n.y * _dot;

	return point_direction(0, 0, _reflect_x, _reflect_y);
}