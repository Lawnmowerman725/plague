/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_moneyHud)
draw_set_halign(fa_right)
sprite_index = spr_moneyPauseHud;
scale = (string_width("$" + string(global.dungeonMoney)) + 45) / sprite_width;

if (!instance_exists(obj_pauseMenu)){
	draw_set_valign(fa_bottom)
	
	draw_sprite_ext(sprite_index, 0, global.dungeonPixelWidth, global.dungeonPixelHeight + hiddenOff, -scale, -1, 0, #FFFFFF, 1);
	drawTextShadow("$" + string(global.dungeonMoney), global.dungeonPixelWidth - 16, global.dungeonPixelHeight - 16 + hiddenOff, #FFFFFF, 1, 4, 4, #000000, 1);
}
else {
	
	draw_set_valign(fa_top)
	draw_sprite_ext(sprite_index, 0, global.dungeonPixelWidth, -hiddenOff + 128, -scale, 1, 0, #FFFFFF, 1);
	drawTextShadow("$" + string(global.dungeonMoney), global.dungeonPixelWidth - 16, -hiddenOff + 16 + 128, #FFFFFF, 1, 4, 4, #000000, 1);
}

sprite_index = spr_idleHud;
draw_set_font(fnt_bigger)
draw_set_halign(fa_right)
draw_set_valign(fa_top)

var scale = 0;
var myMess = global.clearConditionTexts[global.clearCondition];

if (string_width(myMess) > string_width("Floor " + string(global.dungeonFloor))){
	scale = (string_width(myMess) + 45) / sprite_width;	
}
else {
	scale = (string_width("Floor " + string(global.dungeonFloor)) + 45) / sprite_width;	
}

draw_sprite_ext(sprite_index, 0, global.dungeonPixelWidth, 0 - hiddenOff, -scale, 1, 0, #FFFFFF, 1)
drawTextShadow("Floor " + string(global.dungeonFloor), global.dungeonPixelWidth - 16, 16 - hiddenOff, #FFFFFF, 1, 4, 4, #000000, 1)

drawTextShadow(myMess, global.dungeonPixelWidth - 16, 64 - hiddenOff, #FFFFFF, 1, 4, 4, #000000, 1);

