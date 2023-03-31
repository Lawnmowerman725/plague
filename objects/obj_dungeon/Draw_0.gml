/// @description Insert description here
// You can write your code in this editor

// Draw Background
if (!global.inBattle || battleStart <= 50) draw_self();

if (global.turnAnimation == 0){
	shiftAmount = 0;
}
shiftDistance = shiftAmount * turnDist;
for(var i = 0; i < array_length(global.spritesToDraw); i++){
	wall = global.spritesToDraw[i];
	coords = wall[0];
	image = getWallSprite(wall[2]);
	drawCol = getColor(wall[1]);
	
	if (!global.inBattle || battleStart <= 50){
		if (wall[1] == 0){
			var leftFloorRight = 1; // assume left wall
			
			// floor ceil check
			if (coords[1] > global.dungeonPixelHeight/2 || coords[5] < global.dungeonPixelHeight/2){
				leftFloorRight = 2;
			}
			// right wall check
			else if (coords[0] > global.dungeonPixelWidth/2){
				leftFloorRight = 3;	
			}
			draw_sprite_pos_fixed(image, 0, coords[0] + shiftDistance, coords[1], coords[2] + shiftDistance, coords[3], coords[4] + shiftDistance, coords[5], coords[6] + shiftDistance, coords[7], drawCol[0], drawCol[1], leftFloorRight);
		}
		else {
			if (popInActive != 0 && coords[1] == coords[3] && coords[3] > global.depthsY[2][3] && coords[1] < global.dungeonPixelHeight/2 && coords[5] > global.dungeonPixelHeight/2){ // Alpha wall
				draw_sprite_pos_fixed(image, 0, coords[0] + shiftDistance, coords[1], coords[2] + shiftDistance, coords[3], coords[4] + shiftDistance, coords[5], coords[6] + shiftDistance, coords[7], drawCol[0], drawCol[1]* popInActive/3);
			}
			else {
				draw_sprite_pos_fixed(image, 0, coords[0] + shiftDistance, coords[1], coords[2] + shiftDistance, coords[3], coords[4] + shiftDistance, coords[5], coords[6] + shiftDistance, coords[7], drawCol[0], drawCol[1]);
			}
		}
		
	}	
}

if (global.inBattle){
	if (battleStart <= 50){
		draw_set_alpha(battleStart*0.02);
	}
	else {
		draw_set_alpha(1-(battleStart-50)*0.02);
	}
	draw_set_color(#000000);
	draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
	draw_set_alpha(1);
}






