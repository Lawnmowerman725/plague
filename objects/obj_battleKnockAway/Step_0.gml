/// @description Insert description here
// You can write your code in this editor
scale *= 0.95;

xOff -= scale * 10;

yVel += grav;
yOff += yVel;

bounceCheck();

if (scale <= 0.01){
	instance_destroy();
}