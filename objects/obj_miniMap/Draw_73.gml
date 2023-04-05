/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #FFFFFF, 0.8);

for (cX = -4; cX < 5; cX += 2){
	
	for (cY = -4; cY < 5; cY += 2){
	
		if (cX + global.xPos > 0 && cY + global.yPos > 0 && cY + global.yPos < array_length(global.dungeon) && cX + global.xPos < array_length(global.dungeon[cY + global.yPos]))
		{
			ofValue = false;
			fourWalls = [global.dungeon[cY + global.yPos - 1][cX + global.xPos][1], global.dungeon[cY + global.yPos][cX + global.xPos + 1][1], global.dungeon[cY + global.yPos + 1][cX + global.xPos][1], global.dungeon[cY + global.yPos][cX + global.xPos  - 1][1]];
			
			for (var i = 0; i < 4; i++){
				if (fourWalls[i] != 1){
					ofValue = true;
					break;					
				}				
			}
			
			if (ofValue) {
				draw_sprite(spr_miniMapLand, 0, x + ((2 + cX/2) * siez), y + ((2+cY/2) * siez));
				
				if (fourWalls[0] == 1){
					draw_sprite(spr_miniMapHoriWall, 0, x + ((2+cX/2) * siez), y + ((2+cY/2) * siez));				
				}
				
				if (fourWalls[1] == 1){
					draw_sprite(spr_miniMapVertWall, 0, x + ((cX/2 + 3) * siez), y + ((2+cY/2) * siez));				
				}
				
				if (fourWalls[2] == 1){
					draw_sprite(spr_miniMapHoriWall, 0, x + ((cX/2+2) * siez), y + ((cY/2 + 3) * siez));				
				}
				
				if (fourWalls[3] == 1){
					draw_sprite(spr_miniMapVertWall, 0, x + ((cX/2+2) * siez), y + ((cY/2+2) * siez));				
				}				
			}
		}
	}	
}


draw_sprite(spr_miniMapArrow, global.facing, x+3, y+3);








