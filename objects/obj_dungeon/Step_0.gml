/// @description Insert description here
// You can write your code in this editor
pX = global.xPos;
pY = global.yPos;
pFace = global.facing;

//decreaseTimer();
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

if (global.walkForwardTimer > 0){ // Walk Forward Anim
	
	global.idleTimer = 0;
	
	if (global.walkForwardTimer == global.walkForTime){ // begin
		
		updateVisuals();
	}
	
	if (global.walkForwardTimer == floor(2 * global.walkForTime / 3)){ // Finish Movement
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
		
		updateVisuals();
	}
	
	global.walkForwardTimer --;
	
	if(global.walkForwardTimer == 0){ // Perform landing action
		performTileAction();
		
	}
	exit;
	
	
}

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

if (!global.inBattle && turnCooldown <= 0){
	if (global.idleTimer < 300){
		global.idleTimer += 1;
	}
	getPress();
	getInput();
}

if (pX != global.xPos || pY != global.yPos || pFace != global.facing){
	
	updateVisuals();
}








