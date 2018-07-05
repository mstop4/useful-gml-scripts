/// @desc rgb_to_bgr - converts RGB int/hex to BGR real
/// @param rgb_color {real} example: $00BBFF or 48127

var _rgb = argument[0];

return (_rgb & $FF) << 16 | (_rgb & $FF00) | (_rgb & $FF0000) >> 16;