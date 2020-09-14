function LineSegment(_ax, _ay, _bx, _by) constructor {
	a = new Vector2(_ax, _ay);
	b = new Vector2(_bx, _by);
}

function Rectangle(_left, _top, _right, _bottom) constructor {
	left = _left;
	top = _top;
	right = _right;
	bottom = _bottom;
	
	function width() {
		return right - left;
	}
	
	function height() {
		return bottom - top;
	}
	
	function left_edge() {
		return new LineSegment(left, top, left, bottom);
	}
	
	function top_edge() {
		return new LineSegment(left, top, right, top);
	}
	
	function right_edge() {
		return new LineSegment(right, top, right, bottom);
	}
	
	function bottom_edge() {
		return new LineSegment(left, bottom, right, bottom);
	}
}