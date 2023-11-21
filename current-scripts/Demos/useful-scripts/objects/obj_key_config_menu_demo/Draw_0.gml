draw_set_font(fnt_title);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Control Config Menu Demo");
draw_text(224, 56, "Keyboard");
draw_text(600, 56, "Gamepad");
draw_text(1076, 56, $"Active Gamepad Slot: {my_player.gamepad_slot}");

draw_set_font(fnt_demo);
draw_set_halign(fa_left);
draw_text(32, 320, "Press Tab to switch between configuring and testing the controls.");
draw_text(32, 352, "Press Home to change the active gamepad.");

if (inst_control_manager.gamepad_discovery_mode) {
	draw_text(875, 96, "Press any button on the gamepad\nyou want to switch to.");
}