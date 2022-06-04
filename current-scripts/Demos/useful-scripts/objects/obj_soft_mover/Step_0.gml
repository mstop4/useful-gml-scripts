actual_xpos.update();

soft_clamp_xpos = soft_clamp(actual_xpos.v, actual_xpos.d, limit_min, limit_max);
soft_ceiling_xpos = soft_ceiling(actual_xpos.v, actual_xpos.d, limit_max);
soft_floor_xpos = soft_floor(actual_xpos.v, actual_xpos.d, limit_min);
clamp_xpos = clamp(actual_xpos.v, limit_min, limit_max);
min_xpos = min(actual_xpos.v, limit_max);
max_xpos = max(actual_xpos.v, limit_min);