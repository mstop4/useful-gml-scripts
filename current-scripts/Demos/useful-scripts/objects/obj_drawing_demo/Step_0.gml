percentage.update();
alpha.update();

if (percentage.v == percentage.min_v || percentage.v == percentage.max_v) {
	percentage.d *= -1;
}

if (alpha.v == alpha.min_v || alpha.v == alpha.max_v) {
	alpha.d *= -1;
}