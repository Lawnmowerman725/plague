/// @description Insert description here
// You can write your code in this editor
if (introTimer > 0){
	draw_set_color(#000000);
	draw_set_alpha(introTimer / 60);
	draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
	draw_set_alpha(1);
	introTimer++;
}
if (introTimer > 60){
	room_goto(rm_floorTransition);
}

if (realIntro > 0){
	realIntro--;
	draw_set_color(#000000);
	draw_set_alpha(realIntro / 60);
	draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
	draw_set_alpha(1);
}