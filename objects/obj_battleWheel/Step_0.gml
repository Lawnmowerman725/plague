/// @description Insert description here
// You can write your code in this editor
// Decrease the offset value
if (wheelOffset != 0){
	wheelOffset -= round(10 * sign(wheelOffset));
}
// Check for input
if (wheelOffset == 0) {
	
	// Check for confirm input
	if (keyboard_check_pressed(ord("Z"))){
		creatorID.menuCategory = wheelIndex;
		creatorID.menuDepth = 1;	
		global.battleCursorMemory1 = wheelIndex;
		instance_destroy(id);
		exit;
	}
	
	
	// Check for turn input
	if (keyboard_check(vk_right)  || keyboard_check(ord("D"))){
		wheelIndex = (wheelIndex - 1) % 5;
		if (wheelIndex < 0){
			wheelIndex = 4;
		}
		wheelOffset = 100;
	}
	else if (keyboard_check(vk_left)  || keyboard_check(ord("A"))){
		wheelIndex = (wheelIndex + 1) % 5;
		wheelOffset = -100;
	}
}

arrowTimer = ((arrowTimer + 1/3)) % 20;