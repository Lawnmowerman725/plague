/// @description Insert description here
// You can write your code in this editor
timer++

if (timer < 15) exit;

if (timer > 90){
	instance_destroy();
}

if (timer <= 25 || timer >= 80){
	offset += 4;	
}