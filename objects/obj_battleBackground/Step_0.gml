/// @description Insert description here
// You can write your code in this editor

// FX
if (fxTimer > 0) {
	fxTimer--;
	layer_enable_fx("BattleBack", true);
} else {
	layer_enable_fx("BattleBack", false);
}

switch (movementType){
	case 0:
		xOffset += moveSpeed;
		yOffset += moveSpeed;
		break;
	case 1:
		xOffset += moveSpeed;
		yOffset -= moveSpeed;
		break;
	case 2:
		xOffset += moveSpeed;
		yOffset -= moveSpeed;
		moveSpeed = originalSpeed + originalSpeed/2 * dsin(frameCount);
		break;
	case 3:
		xOffset += moveSpeed;
		yOffset = 40 * moveSpeed * dcos(frameCount);
		break;
}

frameCount ++;
frameCount %= 360;

// update color
myColor = make_color_hsv((midVal + dsin(frameCount) * hueRange), sat, val);

// clamp
if (xOffset > sprite_width){
	xOffset -= sprite_width;
}
if (xOffset < 0) {
	xOffset += sprite_width;
}
if (yOffset > sprite_height){
	yOffset -= sprite_height;
}
if (yOffset < 0) {
	yOffset += sprite_height;
}