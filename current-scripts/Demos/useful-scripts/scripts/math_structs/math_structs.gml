function Vector2(_x, _y) constructor {
	x = _x;
	y = _y;
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