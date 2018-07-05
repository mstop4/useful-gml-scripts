/// @func dialogue_line_breaker(string, max_width, font)
/// @param str
/// @param max_length
/// @param font

var _str = argument[0];
var _max_length = argument[1];
var _font = argument[2];

draw_set_font(_font);
    
// check to see if the string is already short enough to fit on one line.
if (string_width(_str) <= _max_length)
    return _str;
    
var out_str = "";
var in_str_len = string_length(_str);
var line_buffer = "";
var word_buffer = "";
var cur_char = "";
    
// break up string into lines
for (var i=1; i<=in_str_len; i++)
{
    cur_char = string_char_at(_str,i);
        
    // manual line break
    if (cur_char == "\n")
    {
        // if current line is too long, break it
        if (string_width(line_buffer + word_buffer) > _max_length)
            out_str += line_buffer + "\n" + word_buffer + "\n";
            
        else
            out_str += line_buffer + word_buffer + "\n";;
            
        line_buffer = "";
        word_buffer = "";
    }
        
    // space
    else if (cur_char == " ")
    {
        if (string_width(line_buffer + word_buffer + cur_char) > _max_length)
        {
            out_str += line_buffer + word_buffer + "\n";
            line_buffer = "";
            word_buffer = "";
        }
            
        else
        {
            line_buffer += word_buffer + cur_char;
            word_buffer = "";
        }    
    }
        
    // others
    else
    {
        if (string_width(line_buffer + word_buffer + cur_char) > _max_length)
        {
            out_str += line_buffer + "\n";
            line_buffer = "";
            word_buffer += cur_char;
        }
            
        else
        {
            word_buffer += cur_char;
        }   
    }
        
    // end of line
    if (i == in_str_len)
    {
        out_str += line_buffer + word_buffer;
    }
}
    
return out_str;
