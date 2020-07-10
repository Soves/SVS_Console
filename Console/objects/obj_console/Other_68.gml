var _ev = async_load[? "type"];

switch(_ev){
	case network_type_connect:
		console_log("client [" + string(ds_list_size(clients)) + "] connected from: " + async_load[? "ip"]);
		ds_list_add(clients, async_load[? "socket"]);
		break;
		
	case network_type_disconnect:
		var _idx = ds_list_find_index(clients,async_load[? "socket"]);
		ds_list_delete(clients,_idx);
		console_log("client [" + string(_idx) + "] disconnected");
		break;
}