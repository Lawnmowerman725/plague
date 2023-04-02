/// @description Insert description here
// You can write your code in this editor

if (pKey && !global.exitOpen){
	// start moving key
	keyXVel = irandom_range(3, 5);
	keyYVel = irandom_range(-30, -10);
}

if (keyXVel != 0){
	
	// stop moving key
	if (keyY > global.dungeonPixelHeight * 1.1){
		resetKeyPos();	
	}
	else {
		keyY += keyYVel;
		keyX += keyXVel;
		
		keyYVel++;
	}
}


pKey = global.exitOpen;