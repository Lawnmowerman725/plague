global.player = new PlayerFile();
global.classDatabase = createClassDatabase();
global.enemyDatabase = createEnemyDatabase();
global.weaponDatabase = createWeaponDatabase();
global.armorDatabase = createArmorDatabase();
global.skillDatabase = createSkillDatabase();
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
	
	levelCheck = (global.player.experience != power(global.playerLevel+1, 3));

	if (levelCheck) {
		global.playerLevel = floor(power(global.player.experience, 1/3));
		global.playerHP = getPlayerStat(STATS.hp);
		global.playerUP = getPlayerStat(STATS.up);
	}
	
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

