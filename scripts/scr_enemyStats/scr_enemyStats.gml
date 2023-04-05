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

function enemyChooseSkill(_enemyStruct){
	// returns the skill struct
	var _brain = _enemyStruct.brain;
	var _skillArr = _enemyStruct.skills;
	
	var selectedSkill = pointer_null;
	var passTest = false;
	
	while (!passTest){
		// choose a random skill from the list
		var selectedIndex = irandom(array_length(_skillArr));
		selectedSkill = global.skillDatabase[selectedIndex];
		
		var element = selectedSkill.element;
		
		switch (_brain){
			// confirm or deny selection based on brain
			
			case BRAIN.rando:
				// random choice
				passTest = true;
				break;
				
			case BRAIN.phys:
				// prefer physical
				if (element == ELEMENTS.phys){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.fire:
				// prefer fire
				if (element == ELEMENTS.fire){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
			
			case BRAIN.water:
				// prefer water
				if (element == ELEMENTS.water){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.elec:
				// prefer elec
				if (element == ELEMENTS.elec){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.ground:
				// prefer ground
				if (element == ELEMENTS.ground){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.wind:
				// prefer wind
				if (element == ELEMENTS.wind){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.holy:
				// prefer holy
				if (element == ELEMENTS.holy){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.forbid:
				// prefer forbidden
				if (element == ELEMENTS.forbid){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.heal:
				// prefer heal, when low on hp
				if (element == ELEMENTS.heal){
					// low hp, 80% chance
					if (global.enemyHP/getEnemyStat(STATS.hp) < 0.3){
						passTest = random(1) < 0.8;	
					} else {
						// high hp, 
						passTest = random(1) < 0.4;	
					}
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.support:
				// prefer physical
				if (element == ELEMENTS.support){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.ailment:
				// prefer physical
				if (element == ELEMENTS.ailment){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			case BRAIN.unique:
				// prefer physical
				if (element == ELEMENTS.unique){
					// 80% chance
					passTest = random(1) < 0.8;	
				}
				else {
					// 40% chance
					passTest = random(1) < 0.4;	
				}
				break;
				
			default:
				passTest = true;
				break;
		}
		
		// prevent passive skills from being selected
		if (selectedSkill.element == ELEMENTS.passive){
			passTest = false;	
		}
		
		// enemies not likely to heal when hp is high
		if (passTest && element == ELEMENTS.heal){
			if (global.enemyHP/getEnemyStat(STATS.hp) > 0.3){
				passTest = random(1) < 0.4;	
			}
		}
	}
	
	return selectedIndex;
}