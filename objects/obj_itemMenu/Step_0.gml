
// update description box
descriptionBox.myStruct = validItems[currentIndex];

if (skillDepth >= 0){
	// execute item
	if (useItem()) {
		skillDepth = -1;
	}
	exit;	
}

// Decrease the offset value
if (abs(offset) > 35){
	offset -= round(35 * sign(offset));
} else {
	offset = 0;
}

// Amount to draw for slider
top = sprite_height * (currentIndex - 2) / array_length(itemMenuList);
height = sprite_height * 5 / array_length(itemMenuList);

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
		if (itemMenuList[currentIndex].useable && hasItem(validItems[currentIndex].myName)){
			
			if (!pauseMenu){
				creatorID.item = validItems[currentIndex];
				creatorID.itemMemory = currentIndex;
				creatorID.menuDepth = 3;
				instance_destroy(id);
			}
			else {
				// pause menu stuff	
				item = validItems[currentIndex];
				useItem();
			}
			exit;
		}
	}
	
	// Check for back input
	if (keyboard_check_pressed(ord("X"))){
		creatorID.menuDepth = -1;
		creatorID.itemMemory = currentIndex;
		instance_destroy(id);
		exit;
	}
	
	
	// Check for turn input
	if ((keyboard_check(vk_up)  || keyboard_check(ord("W"))) && currentIndex > 0){
		if (waitTimer <= 0){
			if (waitTimer == -1) waitTimer = 12;
			currentIndex--;
			offset = -200;
		}
		else {
			waitTimer--;
		}	
	}
	else if ((keyboard_check(vk_down)  || keyboard_check(ord("S"))) && currentIndex < array_length(itemMenuList) - 1){
		if (waitTimer <= 0){
			if (waitTimer == -1) waitTimer = 12;
			currentIndex++;
			offset = 200;
		}
		else {
			waitTimer--;
		}	
	}
	else {
		waitTimer = -1;	
	}
}


// Update menu stuff
for (var i = 0; i < array_length(itemMenuList); i++){
	var currentItem = itemMenuList[i];
	currentItem.y = yPositionFormula(i - currentIndex) + offset;
	currentItem.x = xPositionFormula(currentItem.y);
	currentItem.menuIndex = currentIndex;
	itemMenuList[i].visible = true;
}