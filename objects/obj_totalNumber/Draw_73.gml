/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_sideName);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(1-offset/40);

// Line
draw_set_color(#000000);
draw_line_width(x - 177, y + 38 + offset, x + 183, y + 38 + offset, 4);
draw_set_color(#DDDDDD);
draw_line_width(x - 180, y + 35 + offset, x + 180, y + 35 + offset, 4);

draw_set_alpha(1);
drawTextShadow("Damage: " + string(myTotal), x, y+offset, #DDDDFF, 1-offset/40, 3, 3, #000000, 1-offset/40);
draw_set_alpha(1);