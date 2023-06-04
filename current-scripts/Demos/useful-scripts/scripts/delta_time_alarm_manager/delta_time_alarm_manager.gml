// Feather disable GM1041
// Feather disable GM1028

/// @func            DeltaTimeAlarm()
/// @desc            Initializes delta time alarm
function DeltaTimeAlarm() constructor {
	duration = -1;
	start_time = -1;
	loop = false;
	callback = noone;
	context = noone;
}


/// @func            DeltaTimeAlarmManager(number)
/// @desc            Initializes delta time alarm manager
/// @deprecated
/// @param {real} _number Number of alarms
function DeltaTimeAlarmManager(_number) constructor {
	dt_alarm = ds_list_create();
	num_alarms = _number;

	for (var _i=0; _i<_number; _i++) {
		var _timer = new DeltaTimeAlarm();
		ds_list_add(dt_alarm, _timer);
	}
	
	/// @func              add_alarm(number)
	/// @desc              Adds a new alarm
	/// @param   {real} _number Number of alarms
	/// @returns {real} New number of alarms
	function add_alarm(_number) {
		for (var _i=0; _i<_number; _i++) {
			var _timer = new DeltaTimeAlarm();
			ds_list_add(dt_alarm, _timer);
		}
		num_alarms += _number;
		return num_alarms;
	}

	/// @func              remove_alarm(index)
	/// @desc              Removes an alarm
	/// @param   {real} _index
	/// @returns {bool} was successful
	function remove_alarm(_index) {
		if (_index < num_alarms) {
			var _timer = dt_alarm[| _index];
			delete _timer;
			ds_list_delete(dt_alarm, _index);
			return true;
		}

		show_debug_message("Warning: DeltaTimeAlarmManager.remove_alarm - index " + string(_index) + "out of bounds");
		return false;
	}
	
	/// @func               set_alarm_timer(index, duration, loop)
	/// @desc               Set an alarm timer
	/// @param   {real}		  _index
	/// @param   {real}     _duration (in seconds) Set to -1 to cancel
	/// @param   {bool}  _loop     Should timer reset itself after triggering?
  /// @returns {bool}  was successful?
	function set_alarm_timer(_index, _duration, _loop) {
		if (_index < num_alarms) {
			dt_alarm[| _index].duration = _duration;
			dt_alarm[| _index].start_time = current_time;
			dt_alarm[| _index].loop = _loop;
			return true;
		}
		
		show_debug_message("Warning: DeltaTimeAlarmManager.set_alarm_timer - index " + string(_index) + "out of bounds");
		return false;
	}
	
	/// @func               set_alarm_callback(index, callback, context)
	/// @desc               Set an alarm callback
	/// @param   {real}					_index
	/// @param   {function}			_callback
	/// @param   {Id.Instance}  _context
  /// @returns {bool}  was successful?
	function set_alarm_callback(_index, _callback, _context) {
		if (_index < num_alarms) {
			dt_alarm[| _index].callback = _callback;
			dt_alarm[| _index].context = _context;
			return true;
		}
		
		show_debug_message("Warning: DeltaTimeAlarmManager.set_alarm_callback - index " + string(_index) + "out of bounds");
		return false;
	}

	/// @func            update()
	/// @desc            Updates alarms
	function update() {
		for (var _i=0; _i<num_alarms; _i++) {
			var _alarm = dt_alarm[| _i];
			
			if (_alarm.duration != -1) {
				var _elapsed = current_time - _alarm.start_time;
		
				if (_elapsed >= _alarm.duration * 1000) {
					with (_alarm.context) {
						// Feather disable once GM1041
						script_execute(_alarm.callback);
					}
					if (_alarm.loop) {
						_alarm.start_time = current_time;
					} else {
						_alarm.duration = -1;
					}
				}
			}
		}
	}
	
	function destroy() {
		for (var _i=0; _i<num_alarms; _i++) {
			delete dt_alarm[| _i];
		}
		ds_list_destroy(dt_alarm);
	}
}