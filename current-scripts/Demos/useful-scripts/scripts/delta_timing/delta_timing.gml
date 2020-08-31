/// @func            dt_init_alarm()
/// @desc            Initializes delta time alarms
/// @param {integer} number
function dt_init_alarms(_number) {
	for (var i=0; i<_number; i++) {
		dt_alarm[i] = -1;
		dt_alarm_scr[i] = -1;
	}
}


/// @func            dt_process_alarms()
/// @desc            Initializes delta time alarms
/// @param {integer} number
function dt_process_alarms(_number) {
	for (var i=0; i<_number; i++) {
		if (dt_alarm[i] != -1) {
			dt_alarm[i] -= dt_scale;
		
			if (dt_alarm[i] <= 0) {
				script_execute(dt_alarm_scr[i]);
				dt_alarm[i] = -1;
			}
		}
	}
}