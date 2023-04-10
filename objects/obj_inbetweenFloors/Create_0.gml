/// @description Insert description here
// You can write your code in this editor

if (global.dungeonFloor >= global.dungeonAmountOfFloors){
	room_goto(rm_ending);
}

// Build floor array
floorArr = [];
for (var i = 0; i < 4; i++){
	
	var potentialNum = round(global.dungeonFloor - 1 + i);
	
	// Make sure number is valid
	if (potentialNum > 0 && potentialNum <= global.dungeonAmountOfFloors){
		array_push(floorArr, string(potentialNum));	
	}
	else {
		array_push(floorArr, "");
	}
}

letterSpacing = global.dungeonPixelWidth / 3;

stopDungeonTheme();