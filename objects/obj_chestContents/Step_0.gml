/// @description Insert description here
// You can write your code in this editor
if (timer > 0){
	timer--;	
}

pulseTimer = ((pulseTimer + 2/3)) % 20;

switch(contentsState){
	
	case 0:
		y -=10;
		if (y < global.dungeonPixelHeight * 0.15){
			y = global.dungeonPixelHeight * 0.15;
			contentsState = 1;
			timer = 60;
		}
		break;
		
	case 1:
		pulseTimer = ((pulseTimer + 2/3)) % 20;
		if (timer <= 0){
			contentsState = 2;
			timer = 60;
			spriteVisible = true;
			
			// apply key if key
			if (category = DROPS.key){
				global.exitOpen = true;
			}			
			descriptionBox = instance_create_depth(x, y, depth - 10, obj_descriptionBox, {category : category, myStruct : chestStruct, setQuantity: quantity});
		}
		break;
		
	case 2:
		// timer must be inactive
		if (timer > 0) break;
		if (keyboard_check_pressed(ord("Z"))){
			spriteVisible = false;
			visible = false;
			with (descriptionBox) {
				goBackwards = true;
			}
			contentsState = 3;
		}
		break;
		
	case 3:
		// wait for description box to disappear
		if (!instance_exists(obj_descriptionBox)){
			visible = true;
			timer = 40;
			contentsState = 4; 
		}
		break;
		
	case 4:
		if (timer > 0) break;
		// move offscreen
		ySpeed += 1;
		y += ySpeed;
		if (y > global.dungeonPixelHeight * 1.2){
			instance_destroy();
		}
		break;
}