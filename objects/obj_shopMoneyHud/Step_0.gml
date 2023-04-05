/// @description Insert description here
// You can write your code in this editor
if (goBack){
	x -= 20;
	if (x < -50){
		instance_destroy();	
	}
}
else {
	if (x >= sprite_width * 0.8){
		x = sprite_width * 0.8;	
	}
	else {
		x += 20;	
	}
}

// For shaking
if (shakeTimer > 0){
	shakeTimer--;
	
	if (shakePos == 0) shakePos = -15;
	
	if (shakePos < 0){
		shakePos -= 4;	
		if (shakePos < -25) shakePos = 15;
	}
	else {
		shakePos += 4;	
		if (shakePos > 25) shakePos = -15;
	}
	if (shakeTimer <= 0){
		shakeTimer = 0;
		shakePos = 0;
	}
}