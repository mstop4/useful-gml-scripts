pulse_counter.update();
pulse_t = pulse(pulse_counter.v, 0.5, 1);

wrap_counter.update();
wrapped_value = wrap(wrap_counter.v, 0, 4);