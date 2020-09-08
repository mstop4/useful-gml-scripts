pulse_counter.update();
pulse_t = pulse(pulse_counter.v, 0.5, 1);

if (pulse_counter.v == 1) {
	pulse_counter.v = 0;
}