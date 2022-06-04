enum TweenLimitMode {
	NONE,
	CEILING,
	FLOOR,
	CLAMP,
	SOFT_CEILING,
	SOFT_FLOOR,
	SOFT_CLAMP,
	WRAP,
	YOYO,
	BOUNCE
}

/// @func Tween(value, delta, min_v, max_v, limit_mode, stop_outside_range)
function Tween(_value, _delta, _min_v, _max_v, _limit_mode, _stop_outside_range) constructor {
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
				case TweenLimitMode.NONE:
					v = _new_v;
					break;
					
				case TweenLimitMode.CEILING:
					v = min(_new_v, max_v);
					break;
					
				case TweenLimitMode.FLOOR:
					v = max(_new_v, min_v);
					break;			
					
				case TweenLimitMode.CLAMP:
					v = clamp(_new_v, min_v, max_v);
					break;
					
				case TweenLimitMode.SOFT_CEILING:
					v = soft_ceiling(v, d, max_v);
					break;
					
				case TweenLimitMode.SOFT_FLOOR:
					v = soft_floor(v, d, min_v);
					break;			
					
				case TweenLimitMode.SOFT_CLAMP:
					v = soft_clamp(v, d, min_v, max_v);
					break;
					
				case TweenLimitMode.WRAP:
					v = wrap(_new_v, min_v, max_v);
					break;
					
				case TweenLimitMode.YOYO:
					v = clamp(_new_v, min_v, max_v);
					if ((v == min_v) || (v == max_v)) {
						d *= -1;
					}
					break;
					
				case TweenLimitMode.BOUNCE:
					v = clamp(_new_v, min_v, max_v);
					if (v == max_v) {
						d *= -1;
					} else if (v == min_v) {
						d = 0;
					}
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