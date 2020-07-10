if hackerMode{
	if alarm[0] = -1 && hackerState = 0{
		console_log("CRACKING PASSWORD...");
		console_log("INJECTING BIT MAP INTO MAINFRAME...");
		alarm[0] = room_speed*3;
		hackerState++;
	}
	if alarm[0] = -1{
		var _str = "";
		repeat(50){
			_str += choose("0","1");
		}
		console_log(_str);
		hackerState++;
	
		if hackerState = 50{
			hackerMode = false;	
			console_log("SUCCESS");
			console_log("Password is Meow123");
		}
		
	}
}