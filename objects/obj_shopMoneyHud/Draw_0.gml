/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x + shakePos, y);

// money
draw_set_font(fnt_moneyHud)
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
drawTextShadow("$" + string(global.dungeonMoney), x + shakePos - 20, y - 30, #FFFFFF, 1, 4, 4, #000000, 1);