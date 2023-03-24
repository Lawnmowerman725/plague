global.spritesToDraw = [];
global.depthsY = [
	[-1960, 140, 381, 445, 473, 493], // Normal
	[-4804, -59, 317, 420, 461, 486], // Moving Forward 1
	[-1698, 242, 400, 453, 479, 502],  // Moving Forward 2
	[-1067.623, -134.387, 113.901, 189.21, 272.286, 345.178, 347.047, 384.434, 388.906, 405.398, 416.101] // Rotate, .0 is farther out
	];
global.dungeonPixelWidth = 1920;
global.dungeonPixelHeight = 1080;



function updateVisuals() {
	global.spritesToDraw = [];
	var wallCenterIndices = [ 3, 4, 3, 3, 1];
	var wallDepths = [ 4, 3, 2, 1, 0];
	var walls = buildCheckArray(); // Returns complete array, 0's if nothing
	var floorCeil = buildFloorCeilArray(); // Each entry is an array, [0,0] if nothing, 0 is floor, 1 is ceil
	var lineToDrawOn = 0;
	
	for (var i = 0; i < array_length(floorCeil); i ++){ // Get floor and ceil coords
		var addingArr = [];
		
		for (var j = 0; j < array_length(floorCeil[i]); j++){
			
			if(floorCeil[i][j][0] != 0){
				lineToDrawOn = wallCenterIndices[i] - j;
				addingArr = getFloorCeilCoords(lineToDrawOn, wallDepths[i], true);
				array_push(addingArr, i*2, floorCeil[i][j][0]);
				
				// if main floor
				if (i == 4 && j == 1){
					array_push(addingArr, true);
				}
				else {
					array_push(addingArr, false);
				}
				array_push(global.spritesToDraw, addingArr);
			}
			
			if(floorCeil[i][j][1] != 0){
				lineToDrawOn = wallCenterIndices[i] - j;
				addingArr = getFloorCeilCoords(lineToDrawOn, wallDepths[i], false);
				array_push(addingArr, i*2, floorCeil[i][j][1],false);
				array_push(global.spritesToDraw, addingArr);
			}
					
		}
	}
	
	wallCenterIndices = [ 3, 4, 3, 3, 2, 3, 2, 1, 0];
	wallDepths = [ 4, 3, 3, 2, 2, 1, 1, 0, 0];
	
	for (var i = 0; i < array_length(walls); i ++){ // Get wall coords
		addingArr = [];
		
		if (i % 2 == 0){
			for (var j = 0; j < array_length(walls[i]) / 2; j++){
				
				if (walls[i][j] != 0){
					lineToDrawOn = wallCenterIndices[i] - j;
					addingArr = getWallCoords(lineToDrawOn, wallDepths[i], true);
					
					array_push(addingArr, i, walls[i][j],false);
					array_push(global.spritesToDraw, addingArr);	
				}
			}
			for (var j = array_length(walls[i])-1; j >= array_length(walls[i]) / 2; j--){
				if (walls[i][j] != 0){
					lineToDrawOn = wallCenterIndices[i] - j;
					addingArr = getWallCoords(lineToDrawOn, wallDepths[i], true);
					
					array_push(addingArr, i, walls[i][j],false);
					array_push(global.spritesToDraw, addingArr);	
				}
			}
		}
		else{
			for (var j = 0; j < array_length(walls[i]); j++){
				if (walls[i][j] != 0){
					lineToDrawOn = wallCenterIndices[i] - j;
					addingArr = getWallCoords(lineToDrawOn, wallDepths[i], false);
					
					array_push(addingArr, i, walls[i][j],false);
					array_push(global.spritesToDraw, addingArr);	
				}
			}
		}
	}
}

function buildCheckArray() {
	var twoDArray = []; // Returned array
	var sizes = [2, 3, 6, 7, 6, 7, 8, 9, 8]; // Widths of returned array
	
	for (var i = 8; i >= 0; i--){ // Loop from back of view to front
		var additionArr = [];
		switch(global.facing){
			case 0:
				
				for (var j = global.xPos+1-sizes[i]; j < global.xPos+sizes[i]; j+= 2){
					if (global.yPos - i >= 0 && j >= 0 && j < array_length(global.dungeon[global.yPos - i])){
						array_push(additionArr, global.dungeon[global.yPos - i][j][0]);
							
					} else {
						array_push(additionArr, 0);
					}	
				}	
				break;
				
			case 1:
				
				for (var j = global.yPos+1-sizes[i]; j < global.yPos+sizes[i]; j+= 2){
					if (j >= 0 && j < array_length(global.dungeon) && global.xPos + i < array_length(global.dungeon[j])){
						array_push(additionArr, global.dungeon[j][global.xPos + i][0]);
		
					} else {
						array_push(additionArr, 0);
					}	
				}	
				break;
				
			case 2:
				
				for (var j = global.xPos-1+sizes[i]; j >= global.xPos-sizes[i]; j-= 2){
					if (global.yPos + i < array_length(global.dungeon) && j >= 0 && j < array_length(global.dungeon[global.yPos + i])){
						array_push(additionArr, global.dungeon[global.yPos + i][j][0]);
					} else {
						array_push(additionArr, 0);
					}	
				}	
				break;
				
			case 3:
		
				for (var j = global.yPos-1+sizes[i]; j > global.yPos-sizes[i]; j-= 2){
					if (global.xPos - i >= 0 && j >= 0 && j < array_length(global.dungeon)){
						array_push(additionArr, global.dungeon[j][global.xPos - i][0]);
						
					} else {
						array_push(additionArr, 0);
					}	
				}	
				break;
			
		}
		array_push(twoDArray, additionArr);
	}
	return twoDArray;
}

function buildFloorCeilArray() {
	var twoDArray = []; // Returned array
	var sizes = [3, 3, 7, 7, 7, 7, 9, 9, 7, 7]; // Widths of returned array
	
	for (var i = 8; i >= 0; i-=2){ // Loop from back of view to front
		var additionArr = [];
		switch(global.facing){
			case 0:
				
				for (var j = global.xPos+1-sizes[i]; j < global.xPos+sizes[i]; j+= 2){
					if (global.yPos - i >= 0 && j >= 0 && j < array_length(global.dungeon[global.yPos - i])){ 
						array_push(additionArr, [global.dungeon[global.yPos - i][j][0], global.dungeon[global.yPos - i][j][1]]);
							
					} else {
						array_push(additionArr, [0,0]);
					}	
				}	
				break;
				
			case 1:
				
				for (var j = global.yPos+1-sizes[i]; j < global.yPos+sizes[i]; j+= 2){
					if (j >= 0 && j < array_length(global.dungeon) && global.xPos + i < array_length(global.dungeon[j])){
						array_push(additionArr, [global.dungeon[j][global.xPos + i][0], global.dungeon[j][global.xPos + i][1]]);
		
					} else {
						array_push(additionArr, [0,0]);
					}	
				}	
				break;
				
			case 2:
				
				for (var j = global.xPos-1+sizes[i]; j >= global.xPos-sizes[i]; j-= 2){
					if (global.yPos + i < array_length(global.dungeon) && j >= 0 && j < array_length(global.dungeon[global.yPos + i])){
						array_push(additionArr, [global.dungeon[global.yPos + i][j][0], global.dungeon[global.yPos + i][j][1]]);
					} else {
						array_push(additionArr, [0,0]);
					}	
				}	
				break;
				
			case 3:
		
				for (var j = global.yPos-1+sizes[i]; j > global.yPos-sizes[i]; j-= 2){
					if (global.xPos - i >= 0 && j >= 0 && j < array_length(global.dungeon)){
						array_push(additionArr, [global.dungeon[j][global.xPos - i][0], global.dungeon[j][global.xPos - i][1]]);
						
					} else {
						array_push(additionArr, [0,0]);
					}	
				}	
				break;
			
		}
		array_push(twoDArray, additionArr);
	}
	return twoDArray;
}

function getWallCoords(line, dDepth, parallel){
	var depthY = global.depthsY[0];
	
		if (global.walkForwardTimer > floor(1 * global.walkForTime / 3)){
			depthY = global.depthsY[2];
		}
		if (global.walkForwardTimer > floor(2 * global.walkForTime / 3)){
			depthY = global.depthsY[1];
		}
	
	
	var wallCoords = [ 0, 0, 0, 0, 0, 0, 0, 0];
	var rightSide = false;
	
	if (line < 0){
		if (parallel){
			line += 1;
		}
		
		line *= -1;
		rightSide = true;
	}
	
	if (parallel) {
		
		var yPosition1 = depthY[dDepth+1];
		var xPosition1 = getPointX(line, yPosition1);
		var yPosition2 = depthY[dDepth];
		var xPosition2 = getPointX(line, yPosition2);
		
		if (rightSide) {
			xPosition1 = reflectMe(xPosition1, global.dungeonPixelWidth / 2);
			xPosition2 = reflectMe(xPosition2, global.dungeonPixelWidth / 2);
		}
		
		wallCoords[0] = xPosition1;
		wallCoords[1] = yPosition1;
		wallCoords[2] = xPosition2;
		wallCoords[3] = yPosition2;
		wallCoords[4] = xPosition2;
		wallCoords[5] = reflectMe(yPosition2, global.dungeonPixelHeight / 2);
		wallCoords[6] = xPosition1;
		wallCoords[7] = reflectMe(yPosition1, global.dungeonPixelHeight / 2);
		
		if (rightSide){
			wallCoords = mirrorWall(wallCoords);
		}
		
		
	} else {
		yPosition1 = depthY[dDepth+1];
		yPosition2 = global.dungeonPixelHeight - yPosition1;
		
		xPosition1 = getPointX(line, yPosition1);
		if (line == 0){
			xPosition2 = reflectMe(xPosition1, global.dungeonPixelWidth / 2);	
		} else {
			xPosition2 = getPointX(line -1, yPosition1);
		}
		
		wallCoords[0] = xPosition1;
		wallCoords[1] = yPosition1;
		wallCoords[2] = xPosition2;
		wallCoords[3] = yPosition1;
		wallCoords[4] = xPosition2;
		wallCoords[5] = yPosition2;
		wallCoords[6] = xPosition1;
		wallCoords[7] = yPosition2;
		
		if (rightSide) {
			for(var i = 0; i < 8; i+=2){
				wallCoords[i] = reflectMe(wallCoords[i], global.dungeonPixelWidth / 2);
			}	
			wallCoords = mirrorWall(wallCoords);					
			
		}
		
	}
	
	
	return [wallCoords];	
	
}

function getFloorCeilCoords(line, dDepth, onFloor){
	var depthY = global.depthsY[0];
	
		if (global.walkForwardTimer > floor(1 * global.walkForTime / 3)){
			depthY = global.depthsY[2];
		}
		if (global.walkForwardTimer > floor(2 * global.walkForTime / 3)){
			depthY = global.depthsY[1];
		}
	
	
	var wallCoords = [ 0, 0, 0, 0, 0, 0, 0, 0];
	var rightSide = false;
	
	if (line < 0){
		line *= -1;
		rightSide = true;
	}
	
	
	var yPosition1 = depthY[dDepth+1];
	var yPosition2 = depthY[dDepth];
		
	var xPosition1 = getPointX(line, yPosition1);
	if (line == 0){
		var xPosition2 = reflectMe(xPosition1, global.dungeonPixelWidth / 2);	
	} else {
		var xPosition2 = getPointX(line -1, yPosition1);
	}
	
	var xPosition4 = getPointX(line, yPosition2);
	if (line == 0){
		var xPosition3 = reflectMe(xPosition4, global.dungeonPixelWidth / 2);	
	} else {
		var xPosition3 = getPointX(line -1, yPosition2);
	}
	
	wallCoords[0] = xPosition1;
	wallCoords[1] = yPosition1;
	wallCoords[2] = xPosition2;
	wallCoords[3] = yPosition1;
	wallCoords[4] = xPosition3;
	wallCoords[5] = yPosition2;
	wallCoords[6] = xPosition4;
	wallCoords[7] = yPosition2;
	
	if (rightSide) {
		for(var i = 0; i < 8; i+=2){
			wallCoords[i] = reflectMe(wallCoords[i], global.dungeonPixelWidth / 2);
		}	
		wallCoords = mirrorWall(wallCoords);					
		
	}
	
	if (onFloor) {
		for(var i = 1; i < 8; i+=2){
			wallCoords[i] = reflectMe(wallCoords[i], global.dungeonPixelHeight / 2);
		}		
	}
	wallCoords = rotateFloorCeil(wallCoords, global.facing);	
	return [wallCoords];	
	
}

function getTurnWallCoords(yStartingIndex, doMirror){
	
	var wallCoords = [ 0, 0, 0, 0, 0, 0, 0, 0];
	var y1, y2, x1, x2;
	//global.depthsY[3][yStartingIndex];
	
	
	switch(yStartingIndex){
		case 0:
			y1 = global.depthsY[3][7];
			y2 = global.depthsY[3][9];
			x1 = getPointXTurn4(y1);
			x2 = getPointXTurn5(y2);
			break;
		case 1:
			y1 = global.depthsY[3][7];
			y2 = global.depthsY[3][10];
			x1 = getPointXTurn4(y1);
			x2 = getPointXTurn4(y2);
			break;
		case 2:
			y1 = global.depthsY[3][5];
			y2 = global.depthsY[3][7];
			x1 = getPointXTurn4(y1);
			x2 = getPointXTurn4(y2);
			break;
		case 3:
			y1 = global.depthsY[3][6];
			y2 = global.depthsY[3][7];
			x1 = getPointXTurn3(y1);
			x2 = getPointXTurn4(y2);
			break;
		case 4:
			y1 = global.depthsY[3][4];
			y2 = global.depthsY[3][6];
			x1 = getPointXTurn3(y1);
			x2 = getPointXTurn3(y2);
			break;
		case 5:
			y1 = global.depthsY[3][2];
			y2 = global.depthsY[3][4];
			x1 = getPointXTurn2(y1);
			x2 = getPointXTurn2(y2);
			break;
		case 6:
			y1 = global.depthsY[3][1];
			y2 = global.depthsY[3][2];
			x1 = getPointXTurn2(y1);
			x2 = getPointXTurn2(y2);
			break;
	}
	
	wallCoords[0] = x1;
	wallCoords[1] = y1;
	wallCoords[2] = x2;
	wallCoords[3] = y2;
	wallCoords[4] = x2;
	wallCoords[5] = reflectMe(y2, global.dungeonPixelHeight/2);
	wallCoords[6] = x1;
	wallCoords[7] = reflectMe(y1, global.dungeonPixelHeight/2);
	
	if (doMirror) {
		wallCoords[0] = reflectMe(x1, global.dungeonPixelWidth/2);
		wallCoords[2] = reflectMe(x2, global.dungeonPixelWidth/2);
		wallCoords[4] = reflectMe(x2, global.dungeonPixelWidth/2);
		wallCoords[6] = reflectMe(x1, global.dungeonPixelWidth/2);
		wallCoords = mirrorWall(wallCoords);
	}
	
	return [wallCoords];	
	
}

// For not turning
function getPointX(line, yHeight){
	var slope = (4 + 8 * (line)) / 3;
	var shift = line * -1440;
	return slope * yHeight + shift + 240;
}

// for turns
function getPointXTurn1(yHeight){
	return 1.6577 * yHeight + 1.42177 * global.dungeonPixelWidth;
}

function getPointXTurn2(yHeight){
	return 6.23077 * yHeight + 0.130368 * global.dungeonPixelWidth;
}

function getPointXTurn3(yHeight){
	return 13.2 * (yHeight - 0.2540 * global.dungeonPixelHeight);
}

function getPointXTurn4(yHeight){
	return 20.31818 * (yHeight - 0.34153 * global.dungeonPixelHeight);
}
	
function getPointXTurn5(yHeight){
	return 24.4117647 * (yHeight - 0.3825136 * global.dungeonPixelHeight);
}

function reflectMe(valyoo, axisVal){
	return axisVal + (axisVal - valyoo);	
}

function mirrorWall(arr){
	var orig = [];
	array_copy(orig, 0, arr, 0, array_length(arr));
	arr[0] = orig[2];
	arr[1] = orig[3];
	arr[2] = orig[0];
	arr[3] = orig[1];
	arr[4] = orig[6];
	arr[5] = orig[7];
	arr[6] = orig[4];
	arr[7] = orig[5];
	
	return arr;
}

function getTurnFloorCeilCoords(yStartingIndex, doMirror, onFloor, left = false){
	
	var wallCoords = [ 0, 0, 0, 0, 0, 0, 0, 0];
	var x1, x2, x3, x4, y1, y2, y3, y4;
	switch (yStartingIndex){
		case -1:
			y1 = global.depthsY[3][8];
			y2 = global.depthsY[3][5];
			y3 = global.depthsY[3][7];
			y4 = global.depthsY[3][9];
			x1 = getPointXTurn5(y1);
			x2 = getPointXTurn4(y2);
			x3 = getPointXTurn4(y3);
			x4 = getPointXTurn5(y4);
			break;
		case 0:
			y1 = global.depthsY[3][7];
			y2 = global.depthsY[3][6];
			y3 = global.depthsY[3][7];
			y4 = global.depthsY[3][10];
			x1 = getPointXTurn4(y1);
			x2 = global.dungeonPixelWidth/2;
			x3 = reflectMe(x1, global.dungeonPixelWidth/2)
			x4 = global.dungeonPixelWidth/2;
			break;
		case 1:
			y1 = global.depthsY[3][5];
			y2 = global.depthsY[3][4];
			y3 = global.depthsY[3][6];
			y4 = global.depthsY[3][7];
			x1 = getPointXTurn4(y1);
			x2 = getPointXTurn3(y2);
			x3 = global.dungeonPixelWidth/2;
			x4 = getPointXTurn4(y4); // cham
			break;
		case 2:
			y1 = global.depthsY[3][4];
			y2 = global.depthsY[3][2];
			y3 = global.depthsY[3][4];
			y4 = global.depthsY[3][6];
			x1 = getPointXTurn3(y1);
			x2 = global.dungeonPixelWidth/2;
			x3 = getPointXTurn2(y3);
			x4 = global.dungeonPixelWidth/2;
			break;
		case 3:
			y1 = global.depthsY[3][3];
			y2 = global.depthsY[3][1];
			y3 = global.depthsY[3][2];
			y4 = global.depthsY[3][4];
			x1 = getPointXTurn3(y1);
			x2 = getPointXTurn2(y2);
			x3 = global.dungeonPixelWidth/2;
			x4 = getPointXTurn3(y4);
			break;
		case 4:
			y1 = global.depthsY[3][1];
			y2 = global.depthsY[3][0];
			y3 = global.depthsY[3][1];
			y4 = global.depthsY[3][2];
			x1 = getPointXTurn2(y1);
			x2 = global.dungeonPixelWidth/2;
			x3 = getPointXTurn1(y3);
			x4 = global.dungeonPixelWidth/2;
			break;
	}
	
	wallCoords[0] = x1;
	wallCoords[1] = y1;
	wallCoords[2] = x2;
	wallCoords[3] = y2;
	wallCoords[4] = x3;
	wallCoords[5] = y3;
	wallCoords[6] = x4;
	wallCoords[7] = y4;
	
	if (doMirror) {
		wallCoords[0] = reflectMe(x1, global.dungeonPixelWidth/2);
		wallCoords[2] = reflectMe(x2, global.dungeonPixelWidth/2);
		wallCoords[4] = reflectMe(x3, global.dungeonPixelWidth/2);
		wallCoords[6] = reflectMe(x4, global.dungeonPixelWidth/2);
		wallCoords = mirrorWall(wallCoords);
	}
	
	if (onFloor) {
		for(var i = 1; i < 8; i+=2){
			wallCoords[i] = reflectMe(wallCoords[i], global.dungeonPixelHeight / 2);
		}
	}	
	
	wallCoords = rotateFloorCeil(wallCoords, global.facing);
	
	if (yStartingIndex == 1 || yStartingIndex == 3 || yStartingIndex == -1){
		if (left){
			if (!doMirror){
				wallCoords = rotateFloorCeil(wallCoords, 3);
			}
		}
		else if(doMirror) {
			wallCoords = rotateFloorCeil(wallCoords, 1);
		}
	}
	
	return [wallCoords];	
	
}

function createTurnVisuals() {
	
	global.spritesToDraw = [];
	var right = (global.turnAnimation > 0);
	
	// Floor and Ceil
	
	// Get the walls and ceilings
	var allWalls = buildFloorCeilArray();
	var addingArr = [];
	var rotatedWalls = [
		[[]],
		[[], []],
		[[], [], [], []],
		[[], []]
	];
	var wDepths = [
		[-1],
		[1, 0],
		[3, 2, 1, -1],
		[4, 3]
	];
	
	if (right) {
		rotatedWalls[0][0] = allWalls[1][5];
		rotatedWalls[1][0] = allWalls[2][4];
		rotatedWalls[1][1] = allWalls[2][5];
		rotatedWalls[2][0] = allWalls[3][3];
		rotatedWalls[2][1] = allWalls[3][4];
		rotatedWalls[2][2] = allWalls[3][5];
		rotatedWalls[2][3] = allWalls[3][6];
		rotatedWalls[3][0] = allWalls[4][1];
		rotatedWalls[3][1] = allWalls[4][2];
		
		// Loop thru them
		for (var i = 0; i < array_length(rotatedWalls); i++){
			for (var j = 0; j < array_length(rotatedWalls[i]); j++){
				if (rotatedWalls[i][j][0] != 0 || rotatedWalls[i][j][1] != 0){
					
					var depthForPush = wDepths[i][j];
					if (depthForPush < 0){
						depthForPush = 0;	
					}
					depthForPush *= 2;					
					var mirrorMe = ((i == 3 && j == 1) || (i == 2 && (j == 2 || j == 3)));					
					
					if (rotatedWalls[i][j][0] != 0){
						addingArr = getTurnFloorCeilCoords(wDepths[i][j], mirrorMe, true);
						array_push(addingArr, depthForPush, rotatedWalls[i][j][0]);
						array_push(global.spritesToDraw, addingArr);
					}
					
					if (rotatedWalls[i][j][1] != 0){
						addingArr = getTurnFloorCeilCoords(wDepths[i][j], mirrorMe, false);
						array_push(addingArr, depthForPush, rotatedWalls[i][j][1]);
						array_push(global.spritesToDraw, addingArr);
					}
					
				}				
			}			
		}
		
	} else {
		rotatedWalls[0][0] = allWalls[1][3];
		rotatedWalls[1][0] = allWalls[2][2];
		rotatedWalls[1][1] = allWalls[2][1];
		rotatedWalls[2][0] = allWalls[3][3];
		rotatedWalls[2][1] = allWalls[3][2];
		rotatedWalls[2][2] = allWalls[3][1];
		rotatedWalls[2][3] = allWalls[3][0];
		rotatedWalls[3][0] = allWalls[4][1];
		rotatedWalls[3][1] = allWalls[4][0];
		
		// Loop thru them
		for (var i = 0; i < array_length(rotatedWalls); i++){
			for (var j = 0; j < array_length(rotatedWalls[i]); j++){
				if (rotatedWalls[i][j][0] != 0 || rotatedWalls[i][j][1] != 0){
					
					var depthForPush = wDepths[i][j];
					if (depthForPush < 0){
						depthForPush = 0;	
					}
					depthForPush *= 2;
					var mirrorMe = !((i == 3 && j == 1) || (i == 2 && (j == 2 || j == 3)));
					
					if (rotatedWalls[i][j][0] != 0){
						addingArr = getTurnFloorCeilCoords(wDepths[i][j], mirrorMe, true, true);
						array_push(addingArr, depthForPush, rotatedWalls[i][j][0]);
						array_push(global.spritesToDraw, addingArr);
					}
					
					if (rotatedWalls[i][j][1] != 0){
						addingArr = getTurnFloorCeilCoords(wDepths[i][j], mirrorMe, false, true);
						array_push(addingArr, depthForPush, rotatedWalls[i][j][1]);
						array_push(global.spritesToDraw, addingArr);
					}
					
				}				
			}			
		}	
		
	}
	// Convert them to coords and pass onto final array
	
	// Walls
	allWalls = buildCheckArray();
	addingArr = [];
	rotatedWalls = [
		[0,0],
		[0,0],
		[0,0],
		[0,0],
		[0,0],
		[0,0],
		[0,0]
	];
	wDepths = [
		[0,0],
		[0,0],
		[2,2],
		[2,2],
		[4,4],
		[6,6],
		[8,8]
	];
	if(right){
		rotatedWalls[0][0] = allWalls[2][5];
		rotatedWalls[0][1] = allWalls[5][6];
		rotatedWalls[1][0] = allWalls[3][5];
		rotatedWalls[1][1] = allWalls[4][5];
		rotatedWalls[2][0] = allWalls[3][4];
		rotatedWalls[2][1] = allWalls[6][5];
		rotatedWalls[3][0] = allWalls[4][4];
		rotatedWalls[3][1] = allWalls[5][5];
		rotatedWalls[4][0] = allWalls[5][4];
		rotatedWalls[4][1] = allWalls[6][4];
		rotatedWalls[5][0] = allWalls[7][2];
		rotatedWalls[5][1] = allWalls[6][3];
		rotatedWalls[6][0] = allWalls[7][1];
		rotatedWalls[6][1] = allWalls[8][1];
		
		for (var i = 0; i < array_length(rotatedWalls); i++){
			for (var j = array_length(rotatedWalls[i])-1; j >= 0; j--){
				if (rotatedWalls[i][j] != 0){
					
					var heightIndex = floor(5 - wDepths[i][j]/2);			
					mirrorMe = (j % 2 == 1);
					
					addingArr = getTurnWallCoords(i, mirrorMe);
					array_push(addingArr, wDepths[i][j], rotatedWalls[i][j]);
					array_push(global.spritesToDraw, addingArr);					
				}				
			}			
		}
	} else {
		rotatedWalls[0][0] = allWalls[2][2];
		rotatedWalls[0][1] = allWalls[5][0];
		rotatedWalls[1][0] = allWalls[3][1];
		rotatedWalls[1][1] = allWalls[4][0];
		rotatedWalls[2][0] = allWalls[3][2];
		rotatedWalls[2][1] = allWalls[6][0];
		rotatedWalls[3][0] = allWalls[4][1];
		rotatedWalls[3][1] = allWalls[5][1];
		rotatedWalls[4][0] = allWalls[5][2];
		rotatedWalls[4][1] = allWalls[6][1];
		rotatedWalls[5][0] = allWalls[7][0];
		rotatedWalls[5][1] = allWalls[6][2];
		rotatedWalls[6][0] = allWalls[7][1];
		rotatedWalls[6][1] = allWalls[8][0];
		
		for (var i = 0; i < array_length(rotatedWalls); i++){
			for (var j = array_length(rotatedWalls[i])-1; j >= 0; j--){
				if (rotatedWalls[i][j] != 0){
					
					var heightIndex = floor(5 - wDepths[i][j]/2);
					mirrorMe = (j % 2 == 0);
					
					addingArr = getTurnWallCoords(i, mirrorMe);
					array_push(addingArr, wDepths[i][j], rotatedWalls[i][j]);
					array_push(global.spritesToDraw, addingArr);					
				}				
			}			
		}		
	}
}

function rotateFloorCeil(arr, fDirection){
	
	var orig = [];
	array_copy(orig, 0, arr, 0, array_length(arr));
	fDirection %= 4;
	
	switch (fDirection) {
		
		case 0:
			break;
			
		case 1:
			arr[0] = orig[6];
			arr[1] = orig[7];
			arr[2] = orig[0];
			arr[3] = orig[1];
			arr[4] = orig[2];
			arr[5] = orig[3];
			arr[6] = orig[4];
			arr[7] = orig[5];
			break;
		
		case 2:
			arr[0] = orig[4];
			arr[1] = orig[5];
			arr[2] = orig[6];
			arr[3] = orig[7];
			arr[4] = orig[0];
			arr[5] = orig[1];
			arr[6] = orig[2];
			arr[7] = orig[3];
			break;
			
		case 3:
			arr[0] = orig[2];
			arr[1] = orig[3];
			arr[2] = orig[4];
			arr[3] = orig[5];
			arr[4] = orig[6];
			arr[5] = orig[7];
			arr[6] = orig[0];
			arr[7] = orig[1];
			break;		
		
	}
	
	return arr;
		
}