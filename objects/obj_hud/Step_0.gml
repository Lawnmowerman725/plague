// Key stuff
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



// HP Stuff
if (hpTimer > 0){
	hpTimer--;
	
	if (hpTimer < 40 && hpTimer >= 20){
		hpDamagePercent -= hpDamageStep;
		if (heal){
			hpDamagePartX += hpDamageStep * hpMaxWidth;	
		}
	}
}
else {
	hpDamagePercent = 0;	
}
	

hpPercent = global.playerHP / getPlayerStat(STATS.hp);

if (hpPercent != pHPPercent){
	heal = pHPPercent < hpPercent;
	hpDamagePercent = abs(pHPPercent - hpPercent);
	if (heal){
		hpDamagePartX = round(pHPPercent * hpMaxWidth);
	}
	else {
		hpDamagePartX = round(hpPercent * hpMaxWidth);
	}
	
	hpDamageStep = hpDamagePercent / 20;
	
	hpTimer = 80;
}
pHPPercent = hpPercent;



// UP Stuff
if (upTimer > 0){
	upTimer--;
	
	if (upTimer < 40 && upTimer >= 20){
		upDamagePercent -= upDamageStep;
		if (heal){
			upDamagePartX += upDamageStep * upMaxWidth;	
		}
	}
}
else {
	upDamagePercent = 0;	
}
	

upPercent = global.playerUP / getPlayerStat(STATS.up);

if (upPercent != pUpPercent){
	heal = pUpPercent < upPercent;
	upDamagePercent = abs(pUpPercent - upPercent);
	if (heal){
		upDamagePartX = round(pUpPercent * upMaxWidth);
	}
	else {
		upDamagePartX = round(upPercent * upMaxWidth);
	}
	
	upDamageStep = upDamagePercent / 20;
	
	upTimer = 80;
}
pUpPercent = upPercent;

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