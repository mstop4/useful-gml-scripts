/// @func Vector2(x, y)
function Vector2(_x, _y) constructor {
	x = _x;
	y = _y;
	
	static to_string = function() {
		return "[ " + string(x) + ", " + string(y) + " ]";
	}
}

/// @func Vector3(x, y, z)
function Vector3(_x, _y, _z) constructor {
	x = _x;
	y = _y;
	z = _z;
	
	static to_string = function() {
		return "[ " + string(x) + ", " + string(y) + ", " + string(z) + " ]";
	}
}

/// @func ValueDelta(value, delta, min_v, max_v)
function ValueDelta(_value, _delta, _min_v, _max_v) constructor {
	v = _value;
	d = _delta;
	min_v = _min_v;
	max_v = _max_v;

	static update = function() {
		if (d != 0) {
			v = clamp(v + d, min_v, max_v);
		}
	}
}