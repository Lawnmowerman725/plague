// Returns an array of classes made from data from the csv file
function createClassDatabase(){
	
	var classData = [];
	var dsGrid = load_csv("classes.csv"); // Get data from csv
	var newClass;
	var startStats = [];
	var levelStats = [];
	var classSkills = [];
	var classPerks = [];
	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
		startStats = [];
		levelStats = [];
		classSkills = [];
		classPerks = [];
		
		// Build start stats
		for (var j = 2; j < 9; j++){
			array_push(startStats, real(dsGrid[# j, i]));
		}
		
		// Build level stats
		for (var j = 9; j < 16; j++){
			array_push(levelStats, real(dsGrid[# j, i]));
		}
		
		// Build class skills
		for (var j = 16; j < 19; j++){
			if (real(dsGrid[# j, i]) != -1){	
				array_push(classSkills, real(dsGrid[# j, i]));
			}
		}
		
		// Build class perks
		for (var j = 19; j < 22; j++){
			if (real(dsGrid[# j, i]) != -1){	
				array_push(classPerks, real(dsGrid[# j, i]));
			}
		}
		
		// Create class struct from data
		newClass = new Class(
			dsGrid[# 0, i],
			dsGrid[# 1, i],
			startStats,
			levelStats,
			classSkills,
			classPerks
		);
		
		// Add it to array of classes
		array_push(classData, newClass);
	}
	
	ds_grid_destroy(dsGrid);
	return classData;
}

function createEnemyDatabase(){
	
	var enemyData = [];
	var dsGrid = load_csv("enemies.csv"); // Get data from csv
	var newEnemy;
	var startStats = [];
	var levelStats = [];
	var enemySkills = [];
	var attElements = [];
	var defElements = [];
	var startRew = [];
	var levelRew = [];
	var item = [];
	var spriteSet;
	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
		startStats = [];
		levelStats = [];
		enemySkills = [];
		attElements = [];
		defElements = [];
		startRew = [];
		levelRew = [];
		item = [];
		
		// Build start stats
		for (var j = 2; j < 9; j++){
			array_push(startStats, real(dsGrid[# j, i]));
		}
		
		// Build level stats
		for (var j = 9; j < 16; j++){
			array_push(levelStats, real(dsGrid[# j, i]));
		}
		
		// Build skills
		for (var j = 16; j < 26; j++){
			if (real(dsGrid[# j, i]) != -1){	
				array_push(enemySkills, real(dsGrid[# j, i]));
			}
		}
		
		// Build base rewards
		for (var j = 27; j < 29; j++){
			array_push(startRew, real(dsGrid[# j, i]));
		}
		
		// Build level rewards
		for (var j = 29; j < 31; j++){
			array_push(levelRew, real(dsGrid[# j, i]));
		}
		
		// Create sprite set
		spriteSet = new SpriteSet(
			asset_get_index(dsGrid[# 31, i]),	// Idle
			asset_get_index(dsGrid[# 32, i]),	// Attack
			asset_get_index(dsGrid[# 33, i]),	// Spell
			asset_get_index(dsGrid[# 34, i]),	// Damaged
			asset_get_index(dsGrid[# 35, i])	// Defeated
		);
		
		// Build attack element multipliers
		for (var j = 36; j < 44; j++){
			array_push(attElements, real(dsGrid[# j, i]));
		}
		
		// Build defend element multipliers
		for (var j = 44; j < 52; j++){
			array_push(defElements, real(dsGrid[# j, i]));
		}
		
		// Item drop chance
		for (var j = 52; j < 56; j++){
			array_push(item, real(dsGrid[# j, i]));
		}
		
		// Create class struct from data
		newEnemy = new Enemy(
			dsGrid[# 0, i],
			dsGrid[# 1, i],
			startStats,
			levelStats,
			enemySkills,
			real(dsGrid[# 26, i]),
			startRew,
			levelRew,
			spriteSet,
			attElements,
			defElements,
			item,
			real(dsGrid[# 56, i])
		);
		
		// Add it to array of classes
		array_push(enemyData, newEnemy);
	}
	
	ds_grid_destroy(dsGrid);
	return enemyData;
}

function createWeaponDatabase(){
	var weaponData = [];
	var dsGrid = load_csv("weapons.csv"); // Get data from csv
	var newWeapon;
	var statMult = [];
	var attElements = [];
	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
		
		statMult = [];
		attElements = [];
		
		// Stat multipliers
		for (var j = 1; j < 8; j++){
			array_push(statMult, real(dsGrid[# j, i]));
		}
		
		// Element attack multipliers
		for (var j = 8; j < 16; j++){
			array_push(attElements, real(dsGrid[# j, i]));
		}
		
		newWeapon = new Gear(
			statMult,
			attElements
		);
		
		array_push(weaponData, newWeapon);
	}
	
	ds_grid_destroy(dsGrid);
	return weaponData;
	
}

function createArmorDatabase(){
	var armorData = [];
	var dsGrid = load_csv("armor.csv"); // Get data from csv
	var newArmor;
	var statMult = [];
	var defElements = [];
	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
		
		statMult = [];
		defElements = [];
		
		// Stat multipliers
		for (var j = 1; j < 8; j++){
			array_push(statMult, real(dsGrid[# j, i]));
		}
		
		// Element defense multipliers
		for (var j = 8; j < 16; j++){
			array_push(defElements, real(dsGrid[# j, i]));
		}
		
		newArmor = new Gear(
			statMult,
			defElements
		);
		
		array_push(armorData, newArmor);
	}
	
	ds_grid_destroy(dsGrid);
	return armorData;
	
}


// Returns an array of classes made from data from the csv file
function createSkillDatabase(){
	
	var skillData = [];
	var dsGrid = load_csv("skills.csv"); // Get data from csv
	var newSkill;	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
			
		// Create skill struct from data
		newSkill = new Skill(
			dsGrid[# 0, i],
			dsGrid[# 13, i],
			real(dsGrid[# 2, i]),
			real(dsGrid[# 1, i]),
			dsGrid[# 3, i],
			real(dsGrid[# 4, i]),
			real(dsGrid[# 5, i]),
			real(dsGrid[# 6, i]),
			real(dsGrid[# 7, i]),
			real(dsGrid[# 8, i]),
			real(dsGrid[# 9, i]),
			real(dsGrid[# 10, i]),
			asset_get_index(dsGrid[# 11, i]),
			real(dsGrid[# 12, i])
		);
		
		// Add it to array of classes
		array_push(skillData, newSkill);
	}
	
	ds_grid_destroy(dsGrid);
	return skillData;
}

// Returns an array of classes made from data from the csv file
function createConsumableDatabase(){
	
	var itemData = [];
	var dsGrid = load_csv("consumables.csv"); // Get data from csv
	var newItem;	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
			
		// Create skill struct from data
		newItem = new Consumable(
			dsGrid[# 0, i],
			real(dsGrid[# 1, i]),
			real(dsGrid[# 2, i]),
			dsGrid[# 3, i],
			real(dsGrid[# 4, i]),
			real(dsGrid[# 5, i]),
			dsGrid[# 6, i]			
		);
		
		// Add it to array of classes
		array_push(itemData, newItem);
		
		// Add to inventory with count
		variable_struct_set(global.consumables, newItem.myName, 1);
	}
	
	ds_grid_destroy(dsGrid);
	return itemData;
}

// returns array of dungeon palettes
function createPaletteDatabase(){
	
	var paletteData = [];
	var dsGrid = load_csv("palettes.csv"); // Get data from csv
	var newPalette;	
	
	for (var i = 1; i < ds_grid_height(dsGrid); i++){
		var _sprites = [];
		var _fog = [];
			
		array_push(_sprites, pointer_null);
		for (var j = 3; j < ds_grid_width(dsGrid); j++){
			array_push(_sprites, asset_get_index(dsGrid[# j, i]));
		}
		
		var splitString = string_split(dsGrid[# 2, i], " ", true);
		// fog color
		for (var j = 0; j < array_length(splitString); j += 2){
			var newCol = real(splitString[j]);
			var newAlpha = real(splitString[j+1]);
			array_push(_fog, [newCol, newAlpha]);			
		}
		
		// Create palette struct from data
		newPalette = new Palette(
			dsGrid[# 0, i],
			dsGrid[# 1, i],
			_sprites,
			_fog
		);
		
		// Add it to array of palettes
		array_push(paletteData, newPalette);
	}
	
	ds_grid_destroy(dsGrid);
	return paletteData;
}