/// @description Insert description here
// You can write your code in this editor
if (image_speed == -1){
	instance_destroy();	
}
else {
	image_speed = 0;
	phase = 1;
	timer = 30;
	image_index = image_number-1;
}