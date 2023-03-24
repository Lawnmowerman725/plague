/// @description Insert description here
// You can write your code in this editor
obj_battle.targeted = !playerTarget;	
//obj_profileImage.targeted = playerTarget;

if (!acceptInput) exit;

if (keyboard_check_pressed(ord("Z"))){
	with(obj_battle){
		menuDepth ++;
	}
	acceptInput = false;
	image_speed = -1;
	exit;
}

if (keyboard_check_pressed(ord("X"))){
	with(obj_battle){
		menuDepth -= 2;
	}
	acceptInput = false;
	image_speed = -1;
	exit;
}