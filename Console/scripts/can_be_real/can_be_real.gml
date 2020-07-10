///@function can_be_real(str)
var str = argument0;

//handle leading spaces
while(string_char_at(str,1)==" "){
  str = string_delete(str,1,1);
}

//handle trailing spaces
while(string_char_at(str,string_length(str))==" "){
  str = string_delete(str,string_length(str),1);
}

//handle negatives
if(string_char_at(str,1)=="-"){
  str = string_delete(str,1,1);
}

//handle decimals
if(string_pos(".",str)>0){
  str = string_delete(str,string_pos(".",str),1);
}

//handle single characters
if(string_length(str)==0){
  return false;
}

return str == string_digits(str);