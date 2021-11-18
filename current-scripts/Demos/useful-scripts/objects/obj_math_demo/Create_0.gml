vec_A = new Vector2(3, 3);
vec_B = new Vector2(-1, 2);
vec_C = new Vector3(-2, 3, 4);
vec_D = new Vector3(10, -5, 7);

pulse_counter = new DynamicValue(0, 0.01, 0, 1, DVLimitMode.WRAP, false);
pulse_t = 0;

wrap_counter = new DynamicValue(-10, 0.01, -10, 10, DVLimitMode.WRAP, false);
wrapped_value = 0;

blin_values = ds_grid_create(5, 5);
blin_values[# 0, 0] = -10;
blin_values[# 0, 4] = 50;
blin_values[# 4, 0] = 25;
blin_values[# 4, 4] = 100;

for (var i=0; i<5; i++) {
	for (var j=0; j<5; j++) {
		blin_values[# i, j] = blin(
			blin_values[# 0, 0],
			blin_values[# 4, 0],
			blin_values[# 0, 4],
			blin_values[# 4, 4],
			i/4, j/4
		);
	}
}