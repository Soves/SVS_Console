///@arg args

var _args = argument0;

var _str = "";
for(var _i = 1; _i < array_length_1d(_args); ++_i){
	_str += _args[_i]+" ";
}

if array_length_1d(_args) = 1{
	_str = "print [text]"
}

console_log(_str);