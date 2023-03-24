/// @description Insert description here
// You can write your code in this editor


// Draw wheel and icons
draw_sprite_ext(spr_battleWheel, 0, 64, global.dungeonPixelHeight, 1, 1, 0, #FFFFFF, 1);
drawWheelIcons(wheelIndex, wheelIcons, wheelOffset)

// Label text
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_moneyHud)
drawTextShadow(wheelActions[wheelIndex], 144, global.dungeonPixelHeight - 40, #FFFFFF, 1, 5, 5, #000000, 1)

if (wheelOffset == 0){
	draw_sprite_ext(spr_iconArrow, 0, (214 - 80 + sin(arrowTimer / 10 * pi) * 4) * 1.5, global.dungeonPixelHeight - 123 * 1.5, 0.8, 0.8, 0, #FFFFFF, 1)
	draw_sprite_ext(spr_iconArrow, 0, (214 + 80 + sin(arrowTimer / 10 * pi + pi) * 4) * 1.5, global.dungeonPixelHeight - 123 * 1.5, -0.8, 0.8, 0, #FFFFFF, 1)
}
