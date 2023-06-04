// Feather disable GM1009
var _super_input = keyboard_check(vk_shift);
var _log_input = true;

if (instance_exists(inst_id_h)) {
	var _h_input = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
	var _old_value = variable_instance_get(inst_id_h, inst_var_name_h);
	var _new_value = is_undefined(_old_value) ? 0 : _old_value;
	_new_value += _h_input * (_super_input ? super_nudge_dist : 1);
	variable_instance_set(inst_id_h, inst_var_name_h, _new_value);
	
	if (_log_input) {
		print(string(inst_id_h) + "." + inst_var_name_h + " = " + string(_new_value));
	}
}

if (instance_exists(inst_id_v)) {
	var _v_input = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	var _old_value = variable_instance_get(inst_id_v, inst_var_name_v);
	var _new_value = is_undefined(_old_value) ? 0 : _old_value;
	_new_value += _v_input * (_super_input ? super_nudge_dist : 1);
	variable_instance_set(inst_id_v, inst_var_name_v, _new_value);
	
	if (_log_input) {
		print(string(inst_id_v) + "." + inst_var_name_v + " = " + string(_new_value));
	}
}