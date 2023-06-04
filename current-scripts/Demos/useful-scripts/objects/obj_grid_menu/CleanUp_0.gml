if (ds_exists(items, ds_type_grid)) {
	for (var _i=0; _i<ds_grid_width(items); _i++) {
		for (var _j=0; _j<ds_grid_height(items); _j++) {
			if (!is_struct(items[# _i, _j])) continue;
			items[# _i, _j].destroy();
			delete items[# _i, _j];
		}
	}
		
	ds_grid_destroy(items);
}

// feather ignore once GM1052
delete control_state;