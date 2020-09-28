function menu_demo_control_handler() {
	pressed_state[MENU_CONTROLS.UP] = keyboard_check_pressed(vk_up);
	pressed_state[MENU_CONTROLS.DOWN] = keyboard_check_pressed(vk_down);
	
	held_state[MENU_CONTROLS.UP] = keyboard_check(vk_up);
	held_state[MENU_CONTROLS.DOWN] = keyboard_check(vk_down);
}