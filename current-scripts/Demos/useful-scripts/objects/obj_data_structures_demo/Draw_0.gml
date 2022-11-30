draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_set_colour(c_white);
draw_text(room_width/2, 16, "Data Structures Demo");

draw_set_halign(fa_left);
draw_text(16, 64, "Choose From Array");
draw_text(16, 160, "Array Find (deprecated, use array_find_index instead)");

draw_set_font(fnt_demo);

// Choose From Array
draw_text(16, 96, "Original Array: " + string(test_array));
draw_text(16, 128, "Random Choice: " + string(choice));

// Array Find
draw_text(16, 192, "Index of Foo: " + string(found));