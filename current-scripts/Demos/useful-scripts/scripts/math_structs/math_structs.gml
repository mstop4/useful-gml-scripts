function Vector2(_x, _y) constructor {
	x = _x;
	y = _y;
}

function Vector3(_x, _y, _z) constructor {
	x = _x;
	y = _y;
	z = _z;
}

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