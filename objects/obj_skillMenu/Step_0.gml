/// @description Insert description here
// You can write your code in this editor

// Decrease the offset value
if (abs(offset) > 35){
	offset -= round(35 * sign(offset));
} else {
	offset = 0;
}

// Amount to draw for slider
top = sprite_height * (currentIndex - 2) / array_length(skillMenuList);
height = sprite_height * 5 / array_length(skillMenuList);

if (top < 0){
	height += top;
	top = 0;
}

if (top + height > sprite_height){
	height = sprite_height - top;
}


// Check for input
if (offset == 0) {
	
	
	// Check for confirm input
	if (keyboard_check_pressed(ord("Z"))){
		if (global.playerUP >= global.skillDatabase[global.player.skills[currentIndex]].cost){
			creatorID.selectedSkill = global.player.skills[currentIndex];
			creatorID.skillMemory = currentIndex;
			creatorID.menuDepth = 3;
			instance_destroy(id);
			exit;
		}
	}
	
	// Check for back input
	if (keyboard_check_pressed(ord("X"))){
		creatorID.menuDepth = -1;
		creatorID.skillMemory = currentIndex;
		instance_destroy(id);
		exit;
	}
	
	
	// Check for turn input
	if ((keyboard_check(vk_up)  || keyboard_check(ord("W"))) && currentIndex > 0){
		currentIndex--;
		offset = -200;
	}
	else if ((keyboard_check(vk_down)  || keyboard_check(ord("S"))) && currentIndex < array_length(skillMenuList) - 1){
		currentIndex++;
		offset = 200;
	}
}


// Update menu stuff
for (var i = 0; i < array_length(skillMenuList); i++){
	var currentSkill = skillMenuList[i];
	currentSkill.y = yPositionFormula(i - currentIndex) + offset;
	currentSkill.x = xPositionFormula(currentSkill.y);
	currentSkill.menuIndex = currentIndex;
	skillMenuList[i].visible = true;
}