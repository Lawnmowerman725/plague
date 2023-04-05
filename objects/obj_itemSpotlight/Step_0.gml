/// @description Insert description here
// You can write your code in this editor
switch (phase){
	case 0:
		// wait for intro to finish
		break;
		
	case 1:
		if (timer > 0){
			timer--;
		}
		else {
			phase = 1.5;	
		}
		break;
		
	case 1.5:
		// based on formula
		switch (myItem.formula){
			case "HP":
				// Calculate stuffs
				total = doRecovery((myItem.value <= 1), myItem.value, true, true);		
				// Create total display
				instance_create_depth(533, 77, depth-10, obj_healNumber, {enemyDamaged: true, myTotal: string(total), hpVal: true});
				break;
				
			case "UP":
				// Calculate stuffs
				total = doRecovery((myItem.value <= 1), myItem.value, true, false);		
				// Create total display
				instance_create_depth(533, 77, depth-10, obj_healNumber, {enemyDamaged: true, myTotal: string(total), hpVal: false});
				break;
				
			case "HPUP":
				// Calculate stuffs
				total = doRecovery((myItem.value <= 1), myItem.value, true, true);		
				// Create total display
				instance_create_depth(533, 77, depth-10, obj_healNumber, {enemyDamaged: true, myTotal: string(total), hpVal: true});
				
				// Calculate stuffs
				total = doRecovery((myItem.value <= 1), myItem.value, true, false);		
				// Create total display
				instance_create_depth(533, 147, depth-10, obj_healNumber, {enemyDamaged: true, myTotal: string(total), hpVal: false});
				break;
		}
		phase = 2;
		break;
		
	case 2:
		// wait for nums to disappear
		if (!instance_exists(obj_healNumber)){
			phase = 3;	
		}
		break;
		
	case 3:
		// go backwards and disappear
		image_speed = -1;
		break;
	
}