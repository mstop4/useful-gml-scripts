/// @func Vector2(x, y)
function Vector2(_x, _y) constructor {
	x = _x;
	y = _y;
	
	static to_string = function() {
		return "[ " + string(x) + ", " + string(y) + " ]";
	}
	
	static add = function(_vec2) {
		return new Vector2(x + _vec2.x, y + _vec2.y);
	}
	
	static subtract = function(_vec2) {
		return new Vector2(x - _vec2.x, y - _vec2.y);
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
	
	static add = function(_vec3) {
		return new Vector3(x + _vec3.x, y + _vec3.y, z + _vec3.z);
	}
	
	static subtract = function(_vec3) {
		return new Vector3(x - _vec3.x, y - _vec3.y, z - _vec3.z);
	}
}

enum DVLimitMode {
	NONE,
	CEILING,
	FLOOR,
	CLAMP,
	SOFT_CEILING,
	SOFT_FLOOR,
	SOFT_CLAMP,
	WRAP
}

/// @func DynamicValue(value, delta, min_v, max_v, limit_mode, stop_outside_range)
function DynamicValue(_value, _delta, _min_v, _max_v, _limit_mode, _stop_outside_range) constructor {
	v = _value;
	d = _delta;
	min_v = _min_v;
	max_v = _max_v;
	limit_mode = _limit_mode;
	stop_outside_range = _stop_outside_range;

	static update = function() {
		if (d != 0) {
			var _old_v = v;
			var _new_v = v + d;

			switch (limit_mode) {
				case DVLimitMode.NONE:
					v = _new_v;
					break;
					
				case DVLimitMode.CEILING:
					v = min(_new_v, max_v);
					break;
					
				case DVLimitMode.FLOOR:
					v = max(_new_v, min_v);
					break;			
					
				case DVLimitMode.CLAMP:
					v = clamp(_new_v, min_v, max_v);
					break;
					
				case DVLimitMode.SOFT_CEILING:
					v = soft_ceiling(v, d, max_v);
					break;
					
				case DVLimitMode.SOFT_FLOOR:
					v = soft_floor(v, d, min_v);
					break;			
					
				case DVLimitMode.SOFT_CLAMP:
					v = soft_clamp(v, d, min_v, max_v);
					break;
					
				case DVLimitMode.WRAP:
					v = wrap(_new_v, min_v, max_v);
					break;
					
				default:
					v = _new_v;
			}
			
			if (stop_outside_range && _old_v == v) {
				d = 0;
			}
		}
	}
}