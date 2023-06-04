if (ds_exists(items, ds_type_list)) {
	for (var i=0; i<num_items; i++) {
		instance_destroy(items[| i].submenu);
		delete items[| i];
	}
		
	ds_list_destroy(items);
}

// feather ignore once GM1052
delete control_state;