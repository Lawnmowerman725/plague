/// @description Insert description here
// You can write your code in this editor
if (array_length(global.tips) > 0){
	draw_sprite(spr_tooltipBack, 0, global.dungeonPixelWidth, global.dungeonPixelHeight)
	//if (!instance_exists(obj_confirmTarget)) drawToolTip();
	drawToolTip();
}