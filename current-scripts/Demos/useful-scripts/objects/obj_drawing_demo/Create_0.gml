surf_circle = surface_create(256, 256);
surf_curved = surface_create(256, 256);

percentage = new Tween(1, -0.01, 0, 1, TWEEN_LIMIT_MODE.CLAMP, false, pointer_null);
alpha = new Tween(1, -0.001, 0.25, 1, TWEEN_LIMIT_MODE.CLAMP, false, pointer_null);