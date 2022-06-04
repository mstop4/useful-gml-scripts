if (ds_exists(items, ds_type_list)) {
	for (var i=0; i<num_items; i++) {
		instance_destroy(items[| i].submenu);
		delete items[| i];
	}
		
	ds_list_destroy(items);
}

delete control_state;