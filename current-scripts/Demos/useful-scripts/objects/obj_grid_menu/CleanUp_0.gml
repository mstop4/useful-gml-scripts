for (var i=0; i<ds_grid_width(items); i++) {
	for (var j=0; j<ds_grid_height(items); j++) {
		if (!is_struct(items[# i, j])) continue;
		items[# i, j].destroy();
		delete items[# i, j];
	}
}
		
ds_grid_destroy(items);
delete control_state;