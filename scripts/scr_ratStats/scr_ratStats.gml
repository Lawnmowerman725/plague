global.player = new PlayerFile();
global.classDatabase = createClassDatabase();
global.enemyDatabase = createEnemyDatabase();
global.weaponDatabase = createWeaponDatabase();
global.armorDatabase = createArmorDatabase();
global.skillDatabase = createSkillDatabase();
global.paletteDatabase = createPaletteDatabase();
global.loadedPalette = global.paletteDatabase[0];
global.consumables = {};
global.consumableDatabase = createConsumableDatabase();
global.playerLevel = 1;
global.playerHP = 13;
global.playerUP = 12;
global.dungeonMoney = 69420;
global.playerStatMods = [1, 1, 1, 1, 1, 1, 1];
updateLevel();

function playerMaxCheck(){
	if (global.playerHP > getPlayerStat(STATS.hp)){
			global.playerHP = getPlayerStat(STATS.hp);
	}
	if (global.playerUP > getPlayerStat(STATS.up)){
			global.playerUP = getPlayerStat(STATS.up);
	}
}

function updateLevel(){
	
	levelCheck = (global.playerLevel < getLevelFromExp(global.player.experience));

	if (levelCheck) {
		global.playerLevel = getLevelFromExp(global.player.experience);
		global.playerHP = getPlayerStat(STATS.hp);
		global.playerUP = getPlayerStat(STATS.up);
	}
	
}

function expRequiredForLevel(_level){
	
	return power(_level, 3) - 1;
		
}

function getLevelFromExp(_exp){
	return floor(power(_exp + 1, 1/3));
}

function getClass() {
	return global.classDatabase[global.player.class];
}

function getWeapon() {
	
	return global.weaponDatabase[global.player.weapon];
}

function getArmor(){
	return global.armorDatabase[global.player.armor];	
}

function getPlayerStat(_stat){
	var myClass = getClass();
	
	var totalStat = myClass.startingStats[_stat];
	totalStat += myClass.levelUpStats[_stat] * global.playerLevel;
	
	totalStat += totalStat * ((getWeapon().stats[_stat]-1) + (getArmor().stats[_stat]-1));
	
	totalStat *= global.playerStatMods[_stat];
	return floor(totalStat);
}

function minCheck(){
	if (global.playerHP < 0){
			global.playerHP = 0;
	}
	if (global.playerUP < 0){
			global.playerUP = 0;
	}
}

function addSkill(_index){
	array_insert(global.player.skills, array_length(global.player.skills)-1, _index);
}

function resetSkills(){
	global.player.skills = [1, 0];
}
