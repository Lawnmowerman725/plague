/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, 0, global.dungeonPixelWidth, 0 - hiddenOff, -1, 1, 0, #FFFFFF, 1)
draw_sprite_ext(sprite_index, 0, global.dungeonPixelWidth+170, global.dungeonPixelHeight + 40 + hiddenOff, -1, -1, 0, #FFFFFF, 1)

draw_set_font(fnt_bigger)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
drawTextShadow("Floor " + string(global.dungeonFloor), global.dungeonPixelWidth - 16, 16 - hiddenOff, #FFFFFF, 1, 4, 4, #000000, 1)
var myMess = global.clearConditionTexts[global.clearCondition];
drawTextShadow(myMess, global.dungeonPixelWidth - 16, 64 - hiddenOff, #FFFFFF, 1, 4, 4, #000000, 1);

draw_set_font(fnt_moneyHud)
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
drawTextShadow("$" + string(global.dungeonMoney), global.dungeonPixelWidth - 16, global.dungeonPixelHeight - 16 + hiddenOff, #FFFFFF, 1, 4, 4, #000000, 1)