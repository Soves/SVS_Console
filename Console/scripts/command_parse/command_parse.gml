///@arg string
var _str = argument0;

//parse string in to a array
var _pos = 1;
var _arr = [];
var _wrd;
while(_pos <= string_length(_str)){
	_wrd = string_word( _str, _pos, " ");
	_arr[array_length_1d(_arr)] = _wrd;
	_pos += string_length(_wrd)+1; // +1 skips space
}

var _cmd = asset_get_index("cmd_"+_arr[0]);

if script_exists(_cmd){
	
	script_execute( _cmd, _arr);
	
}else{
	console_log( "error: no command called " + _arr[0] + " exists, try help");
}