///@arg args
var _args = argument0;

var _list = obj_console.clients;

if array_length_1d(_args) != 2{
	console_log("kick <client|all>");
}else{

	if can_be_real(_args[1]){
		
		//kick and remove
		network_destroy( _list[| real( _args[1]) ] );
		ds_list_delete( _list, real(_args[1]) );
	
	}else if _args[1] = "all"{
		
		var _idx = 0;
		
		repeat(ds_list_size(_list)){
		
			network_destroy(_list[| _idx ] );
			ds_list_delete(_list, _idx);
			_idx++;
		}
		

	}else{
		console_log("error [kick]: incorrect input!");
	}
	
}