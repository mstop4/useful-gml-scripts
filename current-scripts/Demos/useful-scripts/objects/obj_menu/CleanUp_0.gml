for (var i=0; i<num_items; i++) {
	items[| i].destroy();
	delete items[| i];
}
		
ds_list_destroy(items);
delete control_state;