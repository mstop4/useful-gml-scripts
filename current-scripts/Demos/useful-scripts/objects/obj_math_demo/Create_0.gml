vec_A = new Vector2(3, 3);
vec_B = new Vector2(-1, 2);
vec_C = new Vector3(-2, 3, 4);
vec_D = new Vector3(10, -5, 7);

pulse_counter = new DynamicValue(0, 0.01, 0, 1, DVLimitMode.WRAP);
pulse_t = 0;

wrap_counter = new DynamicValue(-10, 0.01, -10, 10, DVLimitMode.WRAP);
wrapped_value = 0;