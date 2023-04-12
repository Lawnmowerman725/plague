/// @description Insert description here
// You can write your code in this editor
arrowTimer = ((arrowTimer + 1/3)) % 20;

switch (phase){
	case 0:
		// falling and bound
		yVel += grav;
		y += yVel;
		if (y > global.dungeonPixelHeight * 0.3){
			yVel *= -0.7;
			y = global.dungeonPixelHeight * 0.3;
			if (yVel > -10){
				phase = 1;
				yVel = 0;
			}
		}
		break;
		
	case 1:
		waitTimer++;
		if (waitTimer > 30){
			phase = 2;	
			waitTimer = -1;
		}
		break;
		
	case 2:
		global.tips = ["[Z] - Confirm"];
		// dem options
		if (keyboard_check_pressed(ord("Z"))){
			instance_create_depth(global.dungeonPixelWidth * 0.7, global.dungeonPixelHeight * 0.55, depth-10, obj_yesNoBox, {creatorID: id});
			global.tips = ["[X] - Cancel", "[Z] - Confirm"];
			phase = 3;
						
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
		else if ((keyboard_check(vk_down)  || keyboard_check(ord("S"))) && index < array_length(gameOverOptions) - 1){
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
		
	case 3:
		// wait for yes / no input
		if (!instance_exists(obj_yesNoBox)){
			if (yesNoResult){
				// commit
				phase = 4;
				global.tips = [];
				doRecovery(true, 1, true, true);
				doRecovery(true, 1, true, false);
			}
			else {
				// do not commit. go back
				phase = 2;
			}
		}
		break;
		
	case 4:
		// rise up
		yVel -= grav;
		y += yVel;
		if (y < global.dungeonPixelHeight * -2){
			if (index == 0){
				// retry
				loadFloor(global.dungeonFloor, false);
				room_goto(rm_dungeon);
			}
			
			if (index == 1){
				// quit
				game_restart();
			}
		}
		break;
		
}