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