function getInput(){
	
	if(keyboard_check(vk_up) || keyboard_check(ord("W"))){
		moveForward();
		//global.cooldown = global.maxCool;
		return;
	}
	if(keyboard_check(vk_left)  || keyboard_check(ord("A"))){
		//turnLeft();
		global.turnAnimation = -global.maxCool;
		return;
	}
	if(keyboard_check(vk_right)  || keyboard_check(ord("D"))){
		//turnRight();
		global.turnAnimation = global.maxCool;
		return;
	}
	return;
}

function getPress(){
	
	if(keyboard_check_pressed(vk_up)  || keyboard_check_pressed(ord("W"))){
		moveForward();
		//global.cooldown = global.maxCool;
		exit;
	}
	if(keyboard_check_pressed(vk_left)   || keyboard_check_pressed(ord("A"))){
		//turnLeft();
		global.turnAnimation = -global.maxCool;
		exit;
	}
	if(keyboard_check_pressed(vk_right)  || keyboard_check_pressed(ord("D"))){
		//turnRight();
		global.turnAnimation = global.maxCool;
		exit;
	}
}