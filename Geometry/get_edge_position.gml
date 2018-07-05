var _player = argument[0];
var _x = _player.x;
var _y = _player.y;
var view_x = global.view_x;
var view_y = global.view_y;
var view_right = view_x+global.view_width;
var view_bottom = view_y+global.view_height;
var view_mid_x = view_x+global.view_width/2;
var view_mid_y = view_y+global.view_height/2;
var y_offset = -24;
var inner_border = 16;

var cur_t1 = -1;
var cur_dist;
var edge_x, edge_y;
var closest_dist = 1000000;
var closest_pos;
closest_pos[0] = -1;
closest_pos[1] = -1;
closest_pos[2] = -1;
			
if (!collision_rectangle(view_x,view_y,view_right,view_bottom,_player,false,false))
{
	// left
	cur_t1 = ray_line_intersect(view_mid_x, view_mid_y,
										_x, _y+y_offset,
										view_x+inner_border, view_bottom-inner_border,
										view_x+inner_border, view_y+inner_border);
				
	if (cur_t1 <> -1)
	{
		edge_x = view_mid_x + lengthdir_x(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		edge_y = view_mid_y + lengthdir_y(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		cur_dist = point_distance(_x, _y+y_offset, edge_x, edge_y);
		
		if (cur_dist < closest_dist)
		{
			closest_dist = cur_dist;
			closest_pos[0] = edge_x;
			closest_pos[1] = edge_y;
			closest_pos[2] = point_direction(view_mid_x,view_mid_y,_x, _y+y_offset);
		}
	}
	
	// right
	cur_t1 = ray_line_intersect(view_mid_x, view_mid_y,
										_x, _y+y_offset,
										view_right-inner_border, view_bottom-inner_border,
										view_right-inner_border, view_y+inner_border);
				
	if (cur_t1 <> -1)
	{
		edge_x = view_mid_x + lengthdir_x(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		edge_y = view_mid_y + lengthdir_y(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		cur_dist = point_distance(_x, _y+y_offset, edge_x, edge_y);
		
		if (cur_dist < closest_dist)
		{
			closest_dist = cur_dist;
			closest_pos[0] = edge_x;
			closest_pos[1] = edge_y;
			closest_pos[2] = point_direction(view_mid_x,view_mid_y,_x, _y+y_offset);
		}
	}
	
	// top
	cur_t1 = ray_line_intersect(view_mid_x, view_mid_y,
										_x, _y+y_offset,
										view_x+inner_border, view_y+inner_border,
										view_right-inner_border, view_y+inner_border);
				
	if (cur_t1 <> -1)
	{
		edge_x = view_mid_x + lengthdir_x(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		edge_y = view_mid_y + lengthdir_y(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		cur_dist = point_distance(_x, _y+y_offset, edge_x, edge_y);
		
		if (cur_dist < closest_dist)
		{
			closest_dist = cur_dist;
			closest_pos[0] = edge_x;
			closest_pos[1] = edge_y;
			closest_pos[2] = point_direction(view_mid_x,view_mid_y,_x, _y+y_offset);
		}
	}
	
	// bottom
	cur_t1 = ray_line_intersect(view_mid_x, view_mid_y,
										_x, _y+y_offset,
										view_x+inner_border, view_bottom-inner_border,
										view_right-inner_border, view_bottom-inner_border);
				
	if (cur_t1 <> -1)
	{
		edge_x = view_mid_x + lengthdir_x(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		edge_y = view_mid_y + lengthdir_y(cur_t1,point_direction(view_mid_x, view_mid_y, _x, _y+y_offset));
		cur_dist = point_distance(_x, _y+y_offset, edge_x, edge_y);
		
		if (cur_dist < closest_dist)
		{
			closest_dist = cur_dist;
			closest_pos[0] = edge_x;
			closest_pos[1] = edge_y;
			closest_pos[2] = point_direction(view_mid_x,view_mid_y,_x, _y+y_offset);
		}
	}
}

return closest_pos;
