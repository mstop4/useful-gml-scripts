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

enum VDLimitMode {
	NONE,
	CEILING,
	FLOOR,
	CLAMP,
	SOFT_CEILING,
	SOFT_FLOOR,
	SOFT_CLAMP,
	WRAP
}

/// @func ValueDelta(value, delta, min_v, max_v, clamp_mode)
function ValueDelta(_value, _delta, _min_v, _max_v, _clamp_mode) constructor {
	v = _value;
	d = _delta;
	min_v = _min_v;
	max_v = _max_v;
	clamp_mode = _clamp_mode;

	static update = function() {
		if (d != 0) {
			switch (clamp_mode) {
				case VDLimitMode.NONE:
					v += d;
					break;
					
				case VDLimitMode.CEILING:
					v = min(v + d, max_v);
					break;
					
				case VDLimitMode.FLOOR:
					v = max(v + d, min_v);
					break;			
					
				case VDLimitMode.CLAMP:
					v = clamp(v + d, min_v, max_v);
					break;
					
				case VDLimitMode.SOFT_CEILING:
					v = soft_ceiling(v, d, max_v);
					break;
					
				case VDLimitMode.SOFT_FLOOR:
					v = soft_floor(v, d, min_v);
					break;			
					
				case VDLimitMode.SOFT_CLAMP:
					v = soft_clamp(v, d, min_v, max_v);
					break;
					
				case VDLimitMode.WRAP:
					v = wrap(v + d, min_v, max_v);
					
				default:
					v += d;
			}
		}
	}
}