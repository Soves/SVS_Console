///@arg args

var _args = argument0;

if array_length_1d(_args) != 2{
	console_log("scale <number>")
}else{
	
	if can_be_real(_args[1]){
		with(obj_camera){
		obj_camera.ui_scale = real(_args[1]);
		display_set_gui_maximize(zoom*ui_scale,zoom*ui_scale);
		}
	}else{
		console_log("error [scale]: incorrect input!");
	}
}

