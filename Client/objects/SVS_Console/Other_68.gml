var _ev = async_load[? "type"];

switch(_ev){
	case network_type_data:
		var _buff = async_load[? "buffer"];
		
		//parse
		var _arr = [];
		
		while(buffer_tell(_buff) < buffer_get_size(_buff)){
			_arr[array_length_1d(_arr)] = buffer_read(_buff, buffer_string);
		}
		
		var _cmd = asset_get_index(_arr[0]);
		
		if script_exists(_cmd){
			script_execute( _cmd, _arr);
		}
		break;
}