/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("Z"))){
	instance_destroy();
	exit;
}

if (keyboard_check_pressed(ord("X"))){
	yes = false;
	instance_destroy();
	exit;
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)){
	yes = !yes;	
}