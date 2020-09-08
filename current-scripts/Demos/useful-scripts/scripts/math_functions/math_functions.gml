/// @func            normalize_2d(vec)
/// @desc            Normalizes a Vector2
/// @param {Vector2} vec
function normalize_2d(_vec) {
	var _len = point_distance(0, 0, _vec.x, _vec.y);
	return new Vector2(_vec.x / _len, _vec.y / _len);
}


/// @func            normalize_3d(vec)
/// @desc            Normalizes a Vector3
/// @param {Vector3} vec
function normalize_3d(_vec) {
	var _len = point_distance_3d(0, 0, 0, _vec.x, _vec.y, _vec.z);
	return new Vector3(_vec.x / _len, _vec.y / _len, _vec.z / _len);
}


/// @func            cross_product(vec1, vec2)
/// @desc            Calculates cross product of two Vector3s
/// @param {Vector3} vec1 
/// @param {Vector3} vec2
function cross_product(_vec1, _vec2) {
	return new Vector3(
		_vec1.y*_vec2.z - _vec1.z*_vec2.y,
		_vec1.z*_vec2.x - _vec1.x*_vec2.z,
		_vec1.x*_vec2.y - _vec1.y*_vec2.x
	);
}


/// @func            cross_product_2d(vec1, vec2)
/// @desc            Calculates the z-component of the "cross product" of two Vector2s
/// @param {Vector2} vec1 
/// @param {Vector2} vec2
function cross_product_2d(_vec1, _vec2) {
	return _vec1.x*_vec2.y - _vec1.y*_vec2.x;
}


/// @func            cross_product_normalized(vec1, vec2)
/// @desc            Calculates the normalized cross product of two Vector3s
/// @param {Vector3} vec1 
/// @param {Vector3} vec2
function cross_product_normalized(_vec1, _vec2) {
	var _xp = new Vector3(
		_vec1.y*_vec2.z - _vec1.z*_vec2.y,
		_vec1.z*_vec2.x - _vec1.x*_vec2.z,
		_vec1.x*_vec2.y - _vec1.y*_vec2.x
	);
	
	return normalize_3d(_xp);
}


/// @func         pulse(t, min, max)
/// @param {real} t   
/// @param {real} min 
/// @param {real} max
function pulse(_t, _min, _max) {
	return _t >= _min && _t <= _max
		? 1 - ((_t - _min) / (_max - _min))
		: 0;
}


/// @func         soft_ceiling(value, delta, max)
/// @desc         Allows values higher than max to go below, but not values lower than max to go above
/// @param {real} value 
/// @param {real} delta     
/// @param {real} max            
function soft_ceiling(_value, _delta, _max) {
	var _new_value = _value + _delta;
	
	if (_value > _max) {
		return _new_value;
	} else {
		return min(_new_value, _max);
	}
}


/// @func         soft_floor(value, delta, min)
/// @desc         Allows values lower than min to go above, but not values higher than min to go below
/// @param {real} value 
/// @param {real} delta     
/// @param {real} min            
function soft_floor(_value, _delta, _min) {
	var _new_value = _value + _delta;
	
	if (_value < _min) {
		return _new_value;
	} else {
		return max(_new_value, _min);
	}
}


/// @func         soft_clamp(original_value, delta, min, max)
/// @desc         A combination of soft_ceiling and soft_floor
/// @param {real} value 
/// @param {real} delta          
/// @param {real} min            
/// @param {real} max            
function soft_clamp(_value, _delta, _min, _max) {
	var _new_value = _value + _delta;
	
	if (_value < _min || _value > _max) {
		return _new_value;
	} else {
		return clamp(_new_value, _min, _max);
	}
}


/// @func         wrap(value, min, max)
/// @desc         Wraps a value around between min and max
/// @param {real} value 
/// @apara {real} min   
/// @param {real} max   
function wrap(_value, _min, _max) {
	var _range = _max - _min + 1;

	if (_range + _min == 0) return 0;

	while (_value < _min) {
		_value += _range;
	}

	return (_value - _min) mod _range + _min;
}