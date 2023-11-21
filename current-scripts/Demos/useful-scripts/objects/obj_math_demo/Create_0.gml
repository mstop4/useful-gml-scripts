vec_a = new Vector2(3, 3);
vec_b = new Vector2(-1, 2);
vec_c = new Vector3(-2, 3, 4);
vec_d = new Vector3(10, -5, 7);

pulse_counter = new Tween(0, 0.01, 0, 1, TWEEN_LIMIT_MODE.WRAP, false, pointer_null);
pulse_t = 0;

wrap_counter = new Tween(-10, 0.01, -10, 10, TWEEN_LIMIT_MODE.WRAP, false, pointer_null);
wrapped_value = 0;

blin_values = ds_grid_create(5, 5);
blin_values[# 0, 0] = -10;
// Feather disable once GM1043
blin_values[# 0, 4] = 50;
blin_values[# 4, 0] = 25;
blin_values[# 4, 4] = 100;

for (var _i=0; _i<5; _i++) {
	for (var _j=0; _j<5; _j++) {
		blin_values[# _i, _j] = blin(
			blin_values[# 0, 0],
			blin_values[# 4, 0],
			blin_values[# 0, 4],
			blin_values[# 4, 4],
			_i/4, _j/4
		);
	}
}