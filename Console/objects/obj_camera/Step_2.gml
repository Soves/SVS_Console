/// @description Insert description here
// You can write your code in this editor

if instance_exists(follow){
	
	if smoothness > 1{
		view_x += (follow.x-(view_x+view_w/2))/smoothness;
		view_y += (follow.y-(view_y+view_h/2))/smoothness;
	}else{
		view_x = follow.x;
		view_y = follow.y;
	}
}

if clamped{
	view_x = clamp(view_x, 0,room_width-get_zoom(view_zoom,view_w));
	view_y = clamp(view_y, 0,room_height-get_zoom(view_zoom,view_h));
}

camera_set_view_size(view_camera[0],get_zoom(view_zoom,view_w),get_zoom(view_zoom,view_h));

var _round = get_zoom(view_zoom,view_w)/surface_get_width(application_surface);
camera_set_view_pos(view_camera[0],round_n(view_x,_round),round_n(view_y,_round));
