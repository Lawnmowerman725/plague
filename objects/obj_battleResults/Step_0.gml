/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("Z"))){
	menuState++;
	
	// Exit
	if (rewardExp == 0 && rewardMoney == 0){
		instance_destroy();
	}
}

switch (menuState) {
	
	case 0:
		break;
	case 1:
		if (rewardExp > 0){
			if (rewardExp < expStep){	
				global.player.experience += rewardExp;
				rewardExp = 0;
			}
			else {
				global.player.experience += expStep;
				rewardExp -= expStep;
			}
		}
		
		if (rewardMoney > 0){
			if (rewardMoney < moneyStep){	
				global.dungeonMoney += rewardMoney;
				rewardMoney = 0;
			}
			else {
				global.dungeonMoney += moneyStep;
				rewardMoney -= moneyStep;
			}			
		}
		
		roundVals();		
		break;
	
	case 2:
		global.player.experience += rewardExp;
		global.dungeonMoney += rewardMoney;
		
		rewardMoney = 0;
		rewardExp = 0;
		
		roundVals();
		
		var pLevel = global.playerLevel;
		updateLevel();
		if (pLevel != global.playerLevel){
			instance_create_depth(x, y, depth - 100, obj_levelUpText);
		}
		
		menuState++
		break;
}