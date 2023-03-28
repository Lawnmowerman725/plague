/// @description Insert description here
// You can write your code in this editor
sprite_index = sprite;

startX = x;
startY = y;

yVel = -60;

function bounceCheck(){
	if (yOff > xOff * 1.1) {
		yVel = -abs(yVel) * 0.8;	
	}
}