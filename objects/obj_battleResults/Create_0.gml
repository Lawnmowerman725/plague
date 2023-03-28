/// @description Insert description here
// You can write your code in this editor
var expBarX = x - sprite_width/2 + 356; 
var expBarY = y - sprite_height/2 + 228;

expBar = instance_create_depth(expBarX, expBarY, depth - 10, obj_expBar);

expStep = floor(rewardExp / 200);
moneyStep = floor(rewardMoney / 200);

if (expStep < 1) expStep = 1;
if (moneyStep < 1) moneyStep = 1;

function roundVals(){
	global.player.experience = round(global.player.experience);
	rewardExp = round(rewardExp);
	global.dungeonMoney = round(global.dungeonMoney);
	rewardMoney = round(rewardMoney);
}