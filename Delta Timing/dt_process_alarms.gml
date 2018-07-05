for (var i=0; i<16; i++) {
	if (dt_alarm[i] != -1) {
		dt_alarm[i] -= dt_scale;
		
		if (dt_alarm[i] <= 0) {
			script_execute(dt_alarm_scr[i]);
			dt_alarm[i] = -1;
		}
	}
}