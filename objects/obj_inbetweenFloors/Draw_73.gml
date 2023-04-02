/// @description Insert description here
// You can write your code in this editor
if (introTimer > 0){
	draw_set_color(#000000);
	draw_set_alpha(introTimer / 40);
	draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
	draw_set_alpha(1);
}