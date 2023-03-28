/// @description Insert description here
// You can write your code in this editor
var curLevelExp = expRequiredForLevel(global.playerLevel);
var expFromBase = global.player.experience - curLevelExp;
var expToNextLevel = expRequiredForLevel(global.playerLevel + 1) - curLevelExp;
show_debug_message(string(curLevelExp) + " " + string( expFromBase) + " " + string(expToNextLevel));

barPercent = expFromBase / expToNextLevel;

if (barPercent >= 1){
	var pLevel = global.playerLevel;
	updateLevel();
	if (pLevel != global.playerLevel){
		instance_create_depth(x, y, depth - 100, obj_levelUpText);
	}
}

