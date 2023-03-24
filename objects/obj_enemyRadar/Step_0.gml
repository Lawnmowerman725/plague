/// @description Insert description here
// You can write your code in this editor
if (global.encounterTimer < 0){
	hue = 0
}
else {
	hue = global.encounterTimer * 1;
}

drawCol = make_colour_hsv(hue, 255, 255);

if (!global.inBattle && y > 967){
	y = round(y-30)
}

if (global.inBattle && y < 1267){
	y = round(y+30)
}