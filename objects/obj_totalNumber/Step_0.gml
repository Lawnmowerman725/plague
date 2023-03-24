/// @description Insert description here
// You can write your code in this editor
timer++;
if (timer > timerMax){
	instance_destroy();
}

if (offset > 0){
	
	offset-= 2;	
}

if (keyboard_check_pressed(ord("Z"))){
	timer = timerMax;
}