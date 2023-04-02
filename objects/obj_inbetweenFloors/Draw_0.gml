/// @description Insert description here
// You can write your code in this editor

// Draw the floor numbers
draw_set_font(fnt_inbetweenFloor);
draw_set_color(#AAAAAA);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
for (var i = 0; i < 4; i++){
	var xPos = global.dungeonPixelWidth/2 + (i-1) * letterSpacing - letterOffset;
	draw_set_color(#AAAAAA);
	draw_text(xPos, 823, floorArr[i]);
}

// Clear condition
draw_set_font(fnt_sideName);
if (clearConditionFade < 40){
	draw_set_alpha(1);
}
else {
	draw_set_alpha(1 - ((clearConditionFade - 40) / 20));
}
draw_text(global.dungeonPixelWidth/2, 986, global.clearConditionTexts[global.clearCondition]);


draw_set_alpha(1);
draw_self();