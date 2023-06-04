dta_manager = new DeltaTimeAlarmManager(1);

last_timestamp = current_time;
last_time_interval = 0;
game_speed = 60;

dta_manager.set_alarm_callback(0, dta_demo_get_time_interval, id);
dta_manager.set_alarm_timer(0, time_interval, true);
