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

function getForwardWallStoredValue(){
	
	var wallVal = checkForwardWall();
	
	switch (getFirstDigit(wallVal)){
		case WALL.chest:
			// Return the CHEST enum formatted array [category, index, quantity]
			wallVal = global.dungeonChests[getLastDigits(wallVal)];
			break;
		case WALL.npc:
			// Return NPC dialogue array
			wallVal = global.dungeonNPC[getLastDigits(wallVal)];
			break;
		case WALL.boss:
			// Returns the index of the enemy database
			wallVal = getLastDigits(wallVal);
			break;
	}
	
	return wallVal;
}

/*
if (global.dungeon[][] == 9){
	room_goto(win);
}
*/
function moveForward() {
	// First, make sure wall is not event
	var wallAction = checkForwardWall();
	
	var firstDigit = getFirstDigit(wallAction);	
	// Chests will be multiple digits to signify their content, so if chest, fix value
	if (firstDigit == WALL.chest || firstDigit == WALL.boss || firstDigit == WALL.npc){
		wallAction = firstDigit;	
	}
	
	// If special event tile
	if (wallAction > WALL.none){
		
		// Alert the dungeon to begin the event
		if (instance_exists(obj_dungeon)){
			obj_dungeon.eventWall = wallAction;	
		}
		exit;
	}	
	
	switch (global.facing){
		case 0:
			if (global.yPos > 1 && wallAction != 1){
				//global.yPos -= 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
		case 1:
			if (global.xPos < array_length(global.dungeon[y])-2 && wallAction != 1){
				//global.xPos += 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
		case 2:
			if(global.yPos < array_length(global.dungeon)-2 && wallAction != 1){
				//global.yPos += 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
		case 3:
			if (global.xPos > 1  && wallAction != 1){
				//global.xPos -= 2;
				global.walkForwardTimer = global.walkForTime;
				}
			break;
	}
}

function checkForwardWall() {
	// Returns the last digit of the wall array
	switch (global.facing){
		case 0:
			return getRelWall(0, -1);
		case 1:
			return getRelWall(1, 0);
		case 2:
			return getRelWall(0, 1);
		case 3:
			return getRelWall(-1, 0);
	}
	return 0;
}

function getRelWall(xRel, yRel) {
	return global.dungeon[global.yPos + yRel][global.xPos + xRel][1];
}

function editForwardWall(_index, _amount) {
	
	switch (global.facing){
		case 0:
			return setRelWall(0, -1, _index, _amount);
		case 1:
			return setRelWall(1, 0, _index, _amount);
		case 2:
			return setRelWall(0, 1, _index, _amount);
		case 3:
			return setRelWall(-1, 0, _index, _amount);
	}
	return 0;
}

function setRelWall(xRel, yRel, _index, _amount) {
	global.dungeon[global.yPos + yRel][global.xPos + xRel][_index] = _amount;
}

function performWallAction(wallFunc) {
	switch (wallFunc){
		case WALL.none:
			break;
		case WALL.stop:
			break;
		case 2:
			break;
		case 3:
			break;
	}	
}

function performTileAction() {
	switch (global.dungeon[global.yPos][global.xPos][2]){
		case TILE.nothing: // Nothing
			break;
		case TILE.encounter1: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(20);
			}
			break;
		case TILE.encounter2: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(30);
			}
			break;
		case TILE.encounter3: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(40);
			}
			break;
		case TILE.encounter4: // Encounter
			if(global.encounterTimer < 0){
				tryEncounter();	
			} else {
				global.encounterTimer -= random(50);
			}
			break;
	}	
}