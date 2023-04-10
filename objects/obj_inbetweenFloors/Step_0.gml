/// @description Insert description here
// You can write your code in this editor
switch (phase){
	case 0:
		// Wait for intro fade to be over
		if (introTimer > 0){
			introTimer--;
		}
		else {
			introTimer = 0;
			phase = 1;
			global.dungeonFloor = round(global.dungeonFloor + 1);
			loadFloor(global.dungeonFloor);
		}
		break;
		
	case 1:
		// slide letters
		if (letterOffset < letterSpacing){
			offsetSpeed++;
			letterOffset += offsetSpeed;
			if (letterOffset >= letterSpacing){
				letterOffset = letterSpacing;
				phase = 2;
			}
		}
		break;
		
	case 2:
		// fade in the clear condition and wait
		if (clearConditionFade > 0){
			clearConditionFade--;
		}
		else {
			clearConditionFade = 0;
			phase = 2.5;
		}
		break;
		
	case 2.5:
		pauseGeneral++;
		if (pauseGeneral > 40){
			phase = 3;	
		}
		break;
		
	case 3:
		// fade back out
		if (introTimer < 40){
			introTimer++;
		}
		else {
			room_goto(rm_dungeon);
		}
		break;
	
	
}