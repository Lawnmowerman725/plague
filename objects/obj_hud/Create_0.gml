/// @description Insert description here
// You can write your code in this editor
// directions = ["North", "East", "South", "West"];

//instance_create_layer(x, y, "map", obj_profileImage);
hpMaxWidth = sprite_width-6;

barCol = #FFFFFF;
damCol = #999999;
healCol = #CCCCCC;

function resetKeyPos(){
	keyX = x + 48;
	keyY = y + sprite_height + 24 + 48;
	keyYVel = 0;
	keyXVel = 0;
}

resetKeyPos();

function drawHudWander(relX, relY, xRight) {
	
	draw_set_font(fnt_sideName);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Draw player name
	draw_set_colour(c_black);
	draw_text_transformed(relX+4, relY - 141, global.player.myName, 1, 1, 12)
	draw_set_colour(c_white);
	draw_text_transformed(relX, relY - 145, global.player.myName, 1, 1, 12)
	// Draw level
	draw_set_font(fnt_sideLevel);
	draw_set_colour(c_black);
	draw_text_transformed(relX+3, relY - 183, "LV " + string(global.playerLevel), 1, 1, 12)
	draw_set_colour(c_white);
	draw_text_transformed(relX, relY - 185, "LV " + string(global.playerLevel), 1, 1, 12)
	
	// Right side values
	draw_set_font(fnt_sideText);
	draw_set_halign(fa_right);
	drawTextShadow(string(global.playerHP), xRight, relY - 88, #FFFFFF, 1, 3, 3, #000000, 1);
	drawTextShadow(string(global.playerUP), xRight, relY - 41, #FFFFFF, 1, 3, 3, #000000, 1);
	
	// Bars?
	// hp
	myColor = barCol;
	draw_sprite_part_ext(spr_playerHudHP, 0, 3, 0, hpMaxWidth * hpPercent, sprite_height, relX+3, y, 1, 1, myColor, 1);
	// Draw missing portion
	if (hpDamagePercent != 0){
		if (heal){
			myColor = healCol;	
		}
		else {
			myColor = damCol;
		}
	
		draw_sprite_part_ext(spr_playerHudHP, 0, 3 + hpDamagePartX, 0, hpMaxWidth * hpDamagePercent, sprite_height, relX+3+hpDamagePartX, y, 1, 1, myColor, 1);
	}
	
	// up
	myColor = barCol;
	draw_sprite_part_ext(spr_playerHudUP, 0, 3, 0, upMaxWidth * upPercent, sprite_height, relX+3, y, 1, 1, myColor, 1);
	// Draw missing portion
	if (upDamagePercent != 0){
		if (upHeal){
			myColor = healCol;	
		}
		else {
			myColor = damCol;
		}
	
		draw_sprite_part_ext(spr_playerHudUP, 0, 3 + upDamagePartX, 0, upMaxWidth * upDamagePercent, sprite_height, relX+3+upDamagePartX, y, 1, 1, myColor, 1);
	}
}




