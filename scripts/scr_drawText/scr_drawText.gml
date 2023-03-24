draw_set_font(fnt_normal);
#macro amountScale 0.75
global.tips = [];

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
	var percent = (global.playerHP/getPlayerStat(STATS.hp));
	draw_sprite_part(spr_playerHudHP, 0, 3, 0, (sprite_width-6) * percent, sprite_height, x+3, y);
	percent = (global.playerUP/getPlayerStat(STATS.up));
	draw_sprite_part(spr_playerHudUP, 0, 3, 0, 244 * percent, sprite_height, x+3, y);
	/*
	draw_set_colour(c_red);
	
 	draw_rectangle(relX, relY+2*40, relX + amountOver, relY+2*40+10, false);
	draw_set_colour(c_blue);
	amountOver = (xRight-relX) * (global.playerUP/getPlayerStat(STATS.up));
 	draw_rectangle(relX, relY+4*40, relX + amountOver, relY+4*40+10, false);
	draw_set_colour(c_white);
	*/
	
	/*
	// Stats
	draw_set_halign(fa_center);
	
	values = [["ST", getPlayerStat(STATS.st)], ["MG", getPlayerStat(STATS.mg)], ["DF", getPlayerStat(STATS.df)], ["AG", getPlayerStat(STATS.ag)], ["LU", getPlayerStat(STATS.lu)]];
	
	for (var i = 0; i < array_length(values); i++){
		var interval = (xRight - relX)/array_length(values);
		var offse = interval / 2;
		draw_text(relX + offse + i * interval, 440, values[i][0]);
		draw_text(relX + offse + i * interval, 470, values[i][1]);
	}
	*/
	
}