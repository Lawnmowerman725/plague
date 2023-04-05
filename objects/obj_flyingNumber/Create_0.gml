/// @description Insert description here
// You can write your code in this editor
horiSpeed = irandom_range(3, 7);


if (irandom_range(0,1) == 0){
	horiSpeed *= -1;
}

vertSpeed = -1 * irandom_range(10, 23);

if (!playerTurn){
	x = 430;
	y = 80;
	vertSpeed = -1 * irandom_range(0, 5);
	
	horiSpeed = irandom_range(3, 10);
	
	if (!instance_exists(obj_damagePulse)){
		instance_create_depth(0, 0, depth + 5, obj_damagePulse);	
	}
	else {
		obj_damagePulse.myAlpha = 1;
	}
}