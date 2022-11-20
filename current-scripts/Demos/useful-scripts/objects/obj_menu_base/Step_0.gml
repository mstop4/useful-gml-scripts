menu_alpha.update();
view_scroll_progress_y.update();

if ((view_scroll_progress_y.d > 0 && view_scroll_progress_y.v > 0)
	|| (view_scroll_progress_y.d < 0 && view_scroll_progress_y.v < 0)) {
	view_scroll_progress_y.d = 0;
	view_scroll_progress_y.v = 0;
}