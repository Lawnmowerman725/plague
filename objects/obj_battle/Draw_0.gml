/// @description Insert description here
// You can write your code in this editor

// Darken Background
draw_set_alpha(darkness);
draw_set_color(#000000);
draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
draw_set_alpha(1);

if (yOff <= 21 && spriteVisible) draw_sprite_ext(spr_enemyShadow, 0, x + dodgeX + shakePos, y, 1, 1, 0, #FFFFFF, 0.5 * myAlpha);


if (targeted){
	var col = 175 + 80 * sin(pulseTimer / 10 * pi);
	if (spriteVisible) draw_sprite_ext(sprite_index, image_index, x + dodgeX + shakePos, y - yOff, 1, 1, 0, make_color_rgb(col, col, col), myAlpha);
}
else {
	if (spriteVisible) draw_sprite_ext(sprite_index, image_index, x + dodgeX + shakePos, y - yOff, 1, 1, 0, #FFFFFF, myAlpha);
}

draw_sprite(spr_playerTurn, 0, 0, 0)

exit;
//draw_sprite_ext(spr_idleHud, 0, 0, 0, 1, 1, 0, #FFFFFF, 1)
var barPercent = global.enemyHP / getEnemyStat(STATS.hp);
if (barPercent < 0) barPercent = 0;

draw_set_font(fnt_sideText)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
drawTextShadow("LV " + string(global.enemyLevel), 32, 16, #FFFFFF, 1, 4, 4, #000000, 1)
draw_set_color(#000000);
draw_rectangle(32, 64, global.dungeonPixelWidth/3 - 32, 84, false)
draw_set_color(c_red);
draw_rectangle(32, 64, (global.dungeonPixelWidth/3 - 36) * barPercent, 80, false)
draw_set_font(fnt_sideName)
drawTextShadow(string(global.loadedEnemy.myName), 32, 86, #FFFFFF, 1, 4, 4, #000000, 1)







