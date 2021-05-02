/// @func         grids_are_equal(grid1, grid2)
/// @desc         Compares all cells of two DS Grids for equality
/// @param {Grid} grid1
/// @param {Grid} grid2

function grids_are_equal(_grid1, _grid2) {
	return ds_grid_write(_grid1) == ds_grid_write(_grid2);
}

/// @func          choose_from_array(array)
/// @desc					 Chooses a random element from an array
/// @param {Array} array
function choose_from_array(_array) {
	return _array[irandom(array_length(_array)-1)];
}