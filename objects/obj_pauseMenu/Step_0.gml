/// @description Insert description here
// You can write your code in this editor

switch (phase){

	case 0:
		// pause
		global.idleTimer = 300;
		global.tips = ["[X] - Return", "[Z] - Confirm"];
		global.inBattle = false;
		
		if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("X"))) {
			instance_destroy();
			exit;
		}
		
		if (keyboard_check_pressed(ord("Z"))){
			
			switch (index) {
				
				case PAUSE.resume:
					instance_destroy();
					break;
					
				case PAUSE.items:
					if (itemCheck){
						phase = 1;
					}
					break;
					
				case PAUSE.skills:
					phase = 3;
					
					break;
				
			}
			
			exit;
			
		}
		
		// Check for turn input
		if ((keyboard_check(vk_up)  || keyboard_check(ord("W"))) && index > 0){
			if (waitTimer <= 0){
				if (waitTimer == -1) {
					waitTimer = 16;
				}
				else {
					waitTimer = 6;
				}
				index--;
			}
			else {
				waitTimer--;
			}	
		}
		else if ((keyboard_check(vk_down)  || keyboard_check(ord("S"))) && index < array_length(pauseOptions) - 1){
			if (waitTimer <= 0){
				if (waitTimer == -1) {
					waitTimer = 16;
				}
				else {
					waitTimer = 6;
				}
				index++;
			}
			else {
				waitTimer--;
			}	
		}
		else {
			waitTimer = -1;	
		}
		
		break;
		
	case 1:
		// create item menu
		instance_create_depth(global.dungeonPixelWidth, 0, depth - 10, obj_itemMenu, {creatorID: id, pauseMenu: true});
		phase = 2;
		global.idleTimer = 0;
		global.tips = ["[X] - Return", "[Z] - Confirm"];
		global.inBattle = true; // hide the huds
		break;
		
	case 2:
		if (!instance_exists(obj_itemMenu)){
			phase = 0;
			itemCheck = hasItems();
		}
		break;
		
	case 3:
		// create item menu
		instance_create_depth(global.dungeonPixelWidth, 0, depth - 10, obj_skillMenu, {creatorID: id, pauseMenu: true});
		phase = 4;
		global.idleTimer = 0;
		global.tips = ["[X] - Return", "[Z] - Confirm"];
		global.inBattle = true; // hide the huds
		break;
		
	case 4:
		if (!instance_exists(obj_skillMenu)){
			phase = 0;
		}
		break;
}

arrowTimer = ((arrowTimer + 1/3)) % 20;