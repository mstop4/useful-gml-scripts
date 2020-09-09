surf_circle = surface_create(256, 256);
surf_curved = surface_create(256, 256);

percentage = new ValueDelta(1, -0.01, 0, 1, VDLimitMode.CLAMP);
alpha = new ValueDelta(1, -0.001, 0.25, 1, VDLimitMode.CLAMP);