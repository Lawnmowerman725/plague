global.walkForwardTimer = 0;

function turnLeft() {
	global.facing--;
	if (global.facing < 0){
		global.facing = 3;
	}
}

function turnRight() {
	global.facing++;
	if (global.facing > 3){
		global.facing = 0;
	}
}

function safeTileCheck(xRel, yRel) {
	if (global.dungeon[global.yPos + yRel][global.xPos + xRel][1] != 1){
		return true;
	}
	return false;	
}
/*
if (global.dungeon[][] == 9){
	room_goto(win);
}
*/
function moveForward() {
	switch (global.facing){
		case 0:
			if (global.yPos > 1 && checkForwardWall()){
				//global.yPos -= 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
		case 1:
			if (global.xPos < array_length(global.dungeon[y])-2 && checkForwardWall()){
				//global.xPos += 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
		case 2:
			if(global.yPos < array_length(global.dungeon)-2 && checkForwardWall()){
				//global.yPos += 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
		case 3:
			if (global.xPos > 1  && checkForwardWall()){
				//global.xPos -= 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
	}
}

function checkForwardWall() {
	switch (global.facing){
		case 0:
			return safeTileCheck(0, -1);
		case 1:
			return safeTileCheck(1, 0);
		case 2:
			return safeTileCheck(0, 1);
		case 3:
			return safeTileCheck(-1, 0);
	}
	return false;
	
}
function performWallAction(wallFunc) {
	switch (wallFunc){
		case 0:
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			break;
	}	
}

function performTileAction() {
	switch (global.dungeon[global.yPos][global.xPos][2]){
		case 0: // Nothing
			break;
		case 1: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(10);
			}
			break;
		case 2: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(20);
			}
			break;
		case 3: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(30);
			}
			break;
		case 4: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(40);
			}
			break;
			
		case 5: // Chest
			break;
			
		case 6: // Boss
			break;
			
		case 7: // Shop
			break;
			
		case 8: // Staircase
			break;
	}	
}