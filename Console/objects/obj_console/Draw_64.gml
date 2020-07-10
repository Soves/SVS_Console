


var mx = (mouse_x-view_x)/obj_camera.ui_scale;
var my = (mouse_y-view_y)/obj_camera.ui_scale;

var mb_l = mouse_check_button(mb_left);
var mb_l_p = mouse_check_button_pressed(mb_left);

var output = "";

for(var i = 0; i < ds_list_size(log); i++){
	output += log[| i]+"\n";
}


var _type =  "> ";

flash_timer++;
if (flash_timer >= flash_time){
	flash_timer = 0;
}

if (keyboard_string != ""){
	_type += keyboard_string;
	
	if keyboard_check_pressed(vk_enter){
		
		var _out = console_format(keyboard_string);
		console_log(_out);
		
		command_parse(keyboard_string);
		
		keyboard_string = "";
	}
}

if (flash_timer >= flash_time/2){
	_type += "_";
}

output += _type;

draw_text(10,10-log_scroll,output);

//functional stuff

if mouse_wheel_down(){
	if 10+string_height(output) > view_h{
		
		scroll_locked = false;
		log_scroll += 20;
	
		if string_height(output) <= log_scroll{
			scroll_locked = true;
		}
	
		log_scroll = min(log_scroll,20+string_height(output)-view_h);
		
	}
}

if mouse_wheel_up(){
	scroll_locked = false;
	log_scroll -= 20;
	
	log_scroll = max(log_scroll,0);
}


if scroll_locked && 10+string_height(output) > view_h{
	log_scroll = string_height(output)-view_h+20;
}

#region //selection
var _hbox_top = 0;
var _hbox_bottom = 0;
var _hbox_left = 10;
var _hbox_right = 10;
var _char_idx = 1;
var _char_line;

var _is_collision = false;

var _char = "";

draw_set_alpha(.4);
draw_set_color(c_green);

while(_char_idx <= string_length(output)){
	
	_char = string_char_at(output,_char_idx);
	
	if _char = "\n"{
		_hbox_left = 10;
		_hbox_right = 10;
	}
	
	_hbox_bottom = 10-log_scroll+string_height(string_copy(output,1,_char_idx));
	_hbox_top = _hbox_bottom-string_height(_char);
	_hbox_right += string_width(_char);
		
	//here you can access hbox
	if mb_l && point_in_rectangle(mx,my,_hbox_left,_hbox_top,_hbox_right,_hbox_bottom){
		if mb_l_p{
			selectedStart = _char_idx;
			isSelected = true;
		}
		selectedEnd = _char_idx;
		_is_collision = true;
	}
		
	if isSelected && _char_idx >= selectedStart && _char_idx <= selectedEnd{
			
		draw_rectangle(_hbox_left,_hbox_top,_hbox_right-1,_hbox_bottom-1, false);
			
	}
		
	if drawBoxes{
		draw_rectangle(_hbox_left,_hbox_top,_hbox_right,_hbox_bottom, true);
	}
		
	_hbox_left += string_width(_char);
		
	_char_idx++;
}

if isSelected && mb_l_p && !_is_collision{
	isSelected = false;
	selectedStart = -1;
	selectedEnd= -1;
}

draw_set_alpha(1);
draw_set_color(c_lime);

#endregion //selection

if keyboard_check(vk_control) && keyboard_check_pressed(ord("A")){
	isSelected = true;
	selectedStart = 1;
	selectedEnd = string_length(output);
}

if isSelected && keyboard_check(vk_control) && keyboard_check_pressed(ord("C")){
	clipboard_set_text( string_copy(output,selectedStart,selectedEnd-selectedStart+1));
}

if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")){
	keyboard_string += clipboard_get_text();
}