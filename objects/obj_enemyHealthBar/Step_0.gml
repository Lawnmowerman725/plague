/// @description Insert description here
// You can write your code in this editor
if (visibleTimer > 0){
	visible = true;
	visibleTimer--;
	
	if (visibleTimer < 40 && visibleTimer >= 20){
		damagePercent -= damagePercentStep;
		if (heal){
			damagePartX += damagePercentStep * max_width;	
		}
	}
}
else {
	damagePercent = 0;
	visible = false;	
}
	

percent = global.enemyHP / getEnemyStat(STATS.hp);

if (percent != pPercent){
	heal = pPercent < percent;
	damagePercent = abs(pPercent - percent);
	if (heal){
		damagePartX = round(pPercent * max_width);
	}
	else {
		damagePartX = round(percent * max_width);
	}
	
	damagePercentStep = damagePercent / 20;
	
	visibleTimer = 80;
}
pPercent = percent;