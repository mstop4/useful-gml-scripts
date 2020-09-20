if (ds_map_find_value(async_load, "id") == url_request
	&& ds_map_find_value(async_load, "status")) {
	var _result = ds_map_find_value(async_load, "result");
	
	if (_result != "") {
		original_url = _result;
		encoded_url = url_encode(_result);
	}
}