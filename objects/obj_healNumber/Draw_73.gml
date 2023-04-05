/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_sideName);
draw_set_halign(fa_left);
if (!enemyDamaged) draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(1-offset/40);

var myColor = #FFF568;
var outputString = "+ " + string(myTotal) + " HP";
if (!hpVal){
	outputString = "+ " + string(myTotal) + " UP";
	myColor = #7332A5;
}

draw_set_alpha(1);
drawTextShadow(outputString, x, y+offset, myColor, 1-offset/40, 3, 3, #000000, 1-offset/40);
draw_set_alpha(1);