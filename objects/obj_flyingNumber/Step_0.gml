/// @description Insert description here
// You can write your code in this editor
x += horiSpeed;
y += vertSpeed;

vertSpeed += myGrav;

if (y > global.dungeonPixelHeight * 1.5){
	instance_destroy();
}

if (keyboard_check_pressed(ord("Z"))){
	myGrav *= 3;
}