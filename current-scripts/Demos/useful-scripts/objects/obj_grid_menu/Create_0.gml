event_inherited();

items = ds_grid_create(1, 1);
pos = new Vector2(0, 0);
view_area = new Rectangle(0, 0, 0, 0);
view_scroll_progress_x = new Tween(0, 0, -1, 1, TweenLimitMode.CLAMP, true);

grid_menu_functions();