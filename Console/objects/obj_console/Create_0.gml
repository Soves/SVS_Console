log = ds_list_create();
log_scroll = 0;
scroll_locked = true;

//init
console_log("Initializing..");

commandList = [];

var _idx = command_region_start;
var _scr_name;
repeat(command_region_end-command_region_start){
	_scr_name = script_get_name(_idx);
	commandList[array_length_1d(commandList)] = string_copy(_scr_name,5,string_length(_scr_name)-3);
	_idx++;
}

//network setup
port = 3000;
server = network_create_server(network_socket_tcp, port, 10);

flash_time = .5*room_speed;
flash_timer = 0;

if server < 0{
	console_log( "error: Could not initialize server on port: " +  string(port));
}else{
	console_log( "server running on port: " + string(port));
}

clients = ds_list_create();

//other
isSelected = false;
selectedStart = -1;
selectedEnd= -1;

drawBoxes = false;
hackerMode = false;
hackerState = 0;