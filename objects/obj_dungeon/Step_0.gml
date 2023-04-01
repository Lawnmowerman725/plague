/// @description Insert description here
// You can write your code in this editor
pX = global.xPos;
pY = global.yPos;
pFace = global.facing;


// Check for dungeon event
if (eventWall > WALL.stop) {
	global.inBattle = true;
	global.idleTimer = 0;
	
	if (eventWall == WALL.locked && global.exitOpen == false) {
		resetAfterEvent();
		exit;
	}
	
	// Open door
	if (eventTimer == 0){
		editForwardWall(0, PALETTE.doorOpen);
		updateVisuals();
	}
	
	// pause before beginning event
	if (eventTimer < 60){
		eventTimer+=3;
	}
	else {
		if (!instance_exists(obj_dungeonEvent)){
			instance_create_depth(0, 0, depth - 1, obj_dungeonEvent, {myEvent: eventWall})	
		}
	}
	
	exit;
}

// Cooldown after turning
if (turnCooldown > 0){
	turnCooldown--;	
}

// ending and beginning battle
if (global.inBattle && !battleEnding && battleStart < 100){
	battleStart++;
	if (battleStart >= 100){
		battleStart = 100;
	}
}

if (battleEnding && battleStart >= 0){
	battleStart--;
	if (battleStart <= 0){
		battleStart = 0;
		battleEnding = false;
		global.inBattle = false;
		global.encounterTimer = 100;
		playDungeonTheme();
	}
	if (round(battleStart) == 50){
		instance_destroy(obj_battleBackground);
	}
}
if (global.inBattle && !instance_exists(obj_battle)){
	battleEnding = true;	
}

// Walk Forward Anim
if (global.walkForwardTimer > 0){
	
	global.idleTimer = 0;
	
	if (global.walkForwardTimer == global.walkForTime){ // begin
		
		updateVisuals();
	}
	
	if (global.walkForwardTimer == floor(2 * global.walkForTime / 3)){ // Finish Movement
		popInActive = 1;
		switch (global.facing){
			case 0:
				global.yPos -= 2;
				break;
			case 1:
				global.xPos += 2;
				break;
			case 2:
				global.yPos += 2;
				break;
			case 3:
				global.xPos -= 2;
				break;
		}
		
		updateVisuals();
	}
	
	if (global.walkForwardTimer == floor(global.walkForTime / 3)){ // 1/3
		popInActive = 2;
		updateVisuals();
	}
	
	global.walkForwardTimer --;
	
	if(global.walkForwardTimer == 0){ // Perform landing action
		performTileAction();
		popInActive = 0;
		
	}
	exit;
	
	
}

// Turn anim
if (global.turnAnimation != 0){
	
	global.idleTimer = 0;
	
	shiftAmount = turnShiftValues[abs(global.turnAnimation - sign(global.turnAnimation))] * sign(global.turnAnimation);
	if (global.turnAnimation == floor(global.maxCool / 3)){
		turnRight();
		updateVisuals();
		
	}
	
	if (-global.turnAnimation == floor(global.maxCool / 3)){
		turnLeft();
		updateVisuals();
	}
	
	if (abs(global.turnAnimation) == floor(2 * global.maxCool / 3)){
		
		createTurnVisuals();
	}
	global.turnAnimation -= round(abs(global.turnAnimation)/global.turnAnimation);
	if (global.turnAnimation == 0){
		turnCooldown = 4;	
	}
	exit;
	
	
}

// Movement and turning
if (!global.inBattle && turnCooldown <= 0){
	if (global.idleTimer < 300){
		global.idleTimer += 1;
	}
	getPress();
	getInput();
}

// If change, update visuals
if (pX != global.xPos || pY != global.yPos || pFace != global.facing){
	
	updateVisuals();
}








