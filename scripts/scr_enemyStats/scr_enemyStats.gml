global.enemyHP = 10;
global.enemyUP = 10;
global.enemyLevel = 1;
global.enemyStatMod = [1,1,1,1,1,1,1];
global.loadedEnemy = 0;

function loadEnemy(_enemyIndex, _level = 1){
	global.loadedEnemy = global.enemyDatabase[_enemyIndex];
	global.enemyLevel = _level;
	global.enemyStatMod = [1,1,1,1,1,1,1];
	global.enemyHP = getEnemyStat(STATS.hp);
	global.enemyUP = getEnemyStat(STATS.up);
}

function ePerformMove(){
	var selectedMove = global.eMoves[irandom(array_length(global.eMoves)-1)];
	
	switch (selectedMove) {
		
		case 0:
			// do Nothing
			break;
			
		case 1:
			// Normal Attack
			if (eAccuracyCheck()){
				normalAttack(global.eStrength, global.defense, 1.5, eCritForm());
			}
			break;		
	}
}

function enemyMaxCheck(){
	if (global.enemyHP > getEnemyStat(STATS.hp)){
			global.enemyHP = getEnemyStat(STATS.hp);
	}
	if (global.enemyUP > getEnemyStat(STATS.up)){
			global.enemyUP = getEnemyStat(STATS.up);
	}
}

function getEnemyStat(_stat){
	var statTotal = global.loadedEnemy.startingStats[_stat];
	statTotal += global.enemyLevel * global.loadedEnemy.levelUpStats[_stat];
	statTotal *= global.enemyStatMod[_stat];
	
	if (statTotal < 1){
		statTotal = 1;
	}
	
	return floor(statTotal);
}

function getEnemySpoils(_spoil){
	var spoilTotal = global.loadedEnemy.startingRewards[_spoil];
	spoilTotal += global.enemyLevel * global.loadedEnemy.levelRewards[_spoil];
	return floor(spoilTotal);
}