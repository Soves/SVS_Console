///@arg string
///@arg pos
///@arg terminator

var _str = argument0, _pos = argument1, _term = argument2;

var _chr;
var _idx = 0;
while(_pos+_idx <= string_length(_str)){
	_chr = string_char_at(_str, _pos+_idx);
	
	if _chr = _term{
		return string_copy(_str,_pos,_idx);
		break;
	}
	_idx++;
}

return string_copy(_str,_pos,_idx);