///@arg args

var _args = argument0;

if array_length_1d(_args) = 1{
	console_log("charBox <bool>");
}else{
	
	if _args[1] = "true" || _args[1] = "1"{
		obj_console.hackerMode = true;
	}else if _args[1] = "false" || _args[1] = "0"{
		obj_console.hackerMode = false;
	}else{
		console_log("error [charBox]: incorrect input!");
	}
}
