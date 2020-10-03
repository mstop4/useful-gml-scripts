function menu_demo_control_handler() {
	pressed_state[MENU_CONTROLS.UP] = keyboard_check_pressed(vk_up);
	pressed_state[MENU_CONTROLS.DOWN] = keyboard_check_pressed(vk_down);
	pressed_state[MENU_CONTROLS.LEFT] = keyboard_check_pressed(vk_left);
	pressed_state[MENU_CONTROLS.RIGHT] = keyboard_check_pressed(vk_right);
	pressed_state[MENU_CONTROLS.CONFIRM] = keyboard_check_pressed(vk_enter);
	
	held_state[MENU_CONTROLS.UP] = keyboard_check(vk_up);
	held_state[MENU_CONTROLS.DOWN] = keyboard_check(vk_down);
	held_state[MENU_CONTROLS.LEFT] = keyboard_check_pressed(vk_left);
	held_state[MENU_CONTROLS.RIGHT] = keyboard_check_pressed(vk_right);
	held_state[MENU_CONTROLS.CONFIRM] = keyboard_check(vk_enter);
}