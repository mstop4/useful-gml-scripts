surf_circle = surface_create(256, 256);
surf_curved = surface_create(256, 256);

percentage = new DynamicValue(1, -0.01, 0, 1, DVLimitMode.CLAMP, false);
alpha = new DynamicValue(1, -0.001, 0.25, 1, DVLimitMode.CLAMP, false);