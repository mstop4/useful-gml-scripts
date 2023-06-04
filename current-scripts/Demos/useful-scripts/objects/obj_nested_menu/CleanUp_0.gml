if (ds_exists(items, ds_type_list)) {
	for (var _i=0; _i<num_items; _i++) {
		instance_destroy(items[| _i].submenu);
		delete items[| _i];
	}
		
	ds_list_destroy(items);
}

// feather ignore once GM1052
delete control_state;