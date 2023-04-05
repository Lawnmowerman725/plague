/// @description Insert description here
// You can write your code in this editor

switch (phase){

	case 0:
		// pause
		global.idleTimer = 300;
		global.tips = ["[X] - Return", "[Z] - Confirm"];
		
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("X"))) {
			instance_destroy();
			exit;
		}
		
		if (keyboard_check_pressed(ord("Z"))){
			
			switch (index) {
				
				case PAUSE.resume:
					instance_destroy();
					exit;
					break;
				
			}
			
			exit;
			
		}
		/*
		// Check for turn input
		if ((keyboard_check(vk_up)  || keyboard_check(ord("W"))) && index > 0){
			if (waitTimer <= 0){
				if (waitTimer == -1) waitTimer = 12;
				index--;
				offset = -200;
			}
			else {
				waitTimer--;
			}	
		}
		else if ((keyboard_check(vk_down)  || keyboard_check(ord("S"))) && index < array_length(itemMenuList) - 1){
			if (waitTimer <= 0){
				if (waitTimer == -1) waitTimer = 12;
				index++;
				offset = 200;
			}
			else {
				waitTimer--;
			}	
		}
		else {
			waitTimer = -1;	
		}*/
		
		break;
		
	case 1:
		
		break;

}

arrowTimer = ((arrowTimer + 1/3)) % 20;