/// @func  rgb_to_bgr(rgb)
/// @desc  converts RGB int/hex to BGR real
/// @arg   rgb 

var _rgb = argument[0];

return (_rgb & $FF) << 16 | (_rgb & $FF00) | (_rgb & $FF0000) >> 16;