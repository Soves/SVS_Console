///@arg args
var _args = argument0;


if array_length_1d(_args) < 3{
	console_log("rpc <client|all, script, [arguments(optional)]>");
}else{

	if can_be_real(_args[1]){
	
		if ds_list_size(obj_console.clients) > real(_args[1]){
	
			var _buff = buffer_create(256,buffer_grow,1);

			for(var _i = 2; _i < array_length_1d(_args); ++_i){
				buffer_write(_buff, buffer_string, _args[_i]);
			}

			var _cb = network_send_packet(obj_console.clients[| real(_args[1])], _buff, buffer_tell(_buff));

			buffer_delete(_buff);
	
			if _cb < 0 {
				console_log("error [rpc]: packet could not be sent!");
			}else{
				console_log("rpc: packet of " + string(_cb) + " bytes successfully sent");
			}
	
		}else{
			console_log("error [rpc]: client [" + _args[1] + "] does not exist");
		}
	
		
	}else if _args[1] = "all"{
		
		var _buff = buffer_create(256,buffer_grow,1);

		for(var _i = 2; _i < array_length_1d(_args); ++_i){
			buffer_write(_buff, buffer_string, _args[_i]);
		}
		
		var _idx = 0;
		
		repeat(ds_list_size(obj_console.clients)){
		
			var _cb = network_send_packet(obj_console.clients[| _idx], _buff, buffer_tell(_buff));
	
			if _cb < 0 {
				console_log("error [rpc]: packet could not be sent to client [" + string(_idx) + "]!");
			}else{
				console_log("rpc: packet of " + string(_cb) + " bytes successfully sent");
			}
			_idx++;
		}
		
		buffer_delete(_buff);
	}else{
		console_log("error [rpc]: incorrect input!");
	}
	
}