if (!inst_control_manager.gamepad_discovery_mode) {
	inst_control_manager.start_gamepad_discovery_mode(0);
} else {
	inst_control_manager.stop_gamepad_discovery_mode();
}