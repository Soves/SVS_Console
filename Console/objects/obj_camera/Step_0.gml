/// @description
if room = rm_init room_goto_next();

///Toggle Fullscreen and Change Zoom
if keyboard_check_pressed(vk_f9) && !window_get_fullscreen(){
	zoom++;
	
	if(zoom>max_zoom) {zoom=1};
	
	window_set_size(ideal_width*zoom, ideal_height*zoom);
	surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
	display_set_gui_maximize(zoom*ui_scale,zoom*ui_scale);
	alarm[ 0] = 1;
}
if keyboard_check_pressed(vk_f10){
	/// oggles between fullscreen and not fullscreen.
	window_set_fullscreen(!window_get_fullscreen());
	
	if window_get_fullscreen(){
		
		surface_resize(application_surface,display_get_width(),display_get_height());
		
		zoom_prev = zoom;
		zoom = display_get_height()/ideal_height;
		
	}else{
		surface_resize(application_surface,ideal_width*zoom,ideal_height*zoom);
		zoom = zoom_prev;
	}
	
	display_set_gui_maximize(zoom*ui_scale,zoom*ui_scale);
}
