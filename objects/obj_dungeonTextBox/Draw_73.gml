/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(introFade)

// Draw sprite
draw_self();

// Draw text
draw_set_alpha(1);
draw_set_color(#DDDDDD);
draw_set_font(fnt_sideName);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var currentText = string_copy(messageArr[currentBox], 0, floor(amountOfChars));
draw_text_ext_transformed(x, y, currentText, 54, sprite_width * 0.85, 0.8, 0.8, 0);