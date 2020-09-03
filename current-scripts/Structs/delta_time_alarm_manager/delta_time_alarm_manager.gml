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
/// @param {integer} number Number of alarms
function DeltaTimeAlarmManager(_number) constructor {
	dt_alarm = ds_list_create();
	num_alarms = _number;

	for (var i=0; i<_number; i++) {
		var _timer = new DeltaTimeAlarm();
		ds_list_add(dt_alarm, _timer);
	}
	
	/// @func              add_alarm(number)
	/// @desc              Adds a new alarm
	/// @param   {integer} number Number of alarms
	/// @returns {integer} New number of alarms
	function add_alarm(_number) {
		for (var i=0; i<_number; i++) {
			var _timer = new DeltaTimeAlarm();
			ds_list_add(dt_alarm, _timer);
		}
		num_alarms += _number;
		return num_alarms;
	}

	/// @func              remove_alarm(index)
	/// @desc              Removes an alarm
	/// @param   {integer} index
	/// @returns {boolean} was successful
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
	/// @param   {integer}  index
	/// @param   {real}     duration (in seconds) Set to -1 to cancel
	/// @param   {boolean}  loop     Should timer reset itself after triggering?
  /// @returns {boolean}  was successful?
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
	/// @param   {integer}  index
	/// @param   {function} callback
	/// @param   {id}       context
  /// @returns {boolean}  was successful?
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
	/// @param {integer} number
	function update() {
		for (var i=0; i<num_alarms; i++) {
			var _alarm = dt_alarm[| i];
			
			if (_alarm.duration != -1) {
				var _elapsed = current_time - _alarm.start_time;
		
				if (_elapsed >= _alarm.duration * 1000) {
					with (_alarm.context) {
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
		for (var i=0; i<num_alarms; i++) {
			delete dt_alarm[| i];
		}
		ds_list_destroy(dt_alarm);
	}
}