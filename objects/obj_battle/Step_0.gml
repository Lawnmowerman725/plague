
pulseTimer = ((pulseTimer + 5/6)) % 20;

// text box
if (instance_exists(obj_dungeonTextBox)){
	exit;
}
					
// For darkening background
if (goalDarkness != darkness){
	if (goalDarkness > darkness){
		darkness += 0.005;
		if (goalDarkness < darkness){
			darkness = goalDarkness;	
		}
	}
	else {
		darkness -= 0.005;
		if (goalDarkness > darkness){
			darkness = goalDarkness;	
		}
	}
}


// For sprite flashing
if (visibilityTimer > 0){
	visibilityTimer--;
	spriteVisible = false;
}
else {
	spriteVisible = true;
}

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

// For dodge animation
if (goalDodge != 0){
	
	dodgeFrameCount+=4;
	dodgeX = dsin(dodgeFrameCount) * goalDodge;
	
	if (dodgeFrameCount >= 180) {
		goalDodge = 0;
		dodgeX = 0;
		dodgeFrameCount = 0;
	}
}

// fade out
if (beginFade){
	myAlpha -= 0.013;
	if (myAlpha < 0){
		myAlpha = 0;
		beginFade = false;
	}
}

// For when enemy finishing intro animation
if (!introOver){
	if (yOff > 0){
		if (yOff <= 21){
			if (bossBattle){
				playBossTheme();
			}
			else {
				playBattleTheme();
			}
		}
		yOff -= 30;
		
		if (yOff < 0) yOff = 0;
	
	} else {
		yOff = 0;
		menuDepth = pushContent(global.loadedEnemy.myName + " appeared!", true);
		if (menuDepth == 1){
			introOver = true;
			if (bossBattle) {
				// creates the text box
				var boxMess = [
					"I must commend you for making it this far, " + global.player.myName + ".",
					"However, I cannot allow you to leave my tower alive.",
					"Come at me... if you dare!"
				]
				instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, creatorID: id});
			}
			menuDepth = -1;
		}
	
	}
	exit;
}

// End of battle
if (battleOver) {
	if (global.enemyHP <= 0) visibilityTimer = 100;
	global.tips = ["[Z] - Confirm"];
	
	switch (menuDepth){
		case -1:
			if (beginFade) exit;
			global.tips = [];
			instance_destroy(id);
			audio_stop_sound(snd_battleWin);
			exit;
			break;
			
		case 0:
			if (global.enemyHP <= 0){
				// Won the battle
				menuDepth = pushContent(global.loadedEnemy.myName + " was defeated!", true, false, 0, 1);
			}
			else if (global.playerHP <= 0) {
				// lost the battle
				menuDepth = pushContent("The battle was lost...", true, false, 0, 3);
			}
			else {
				// flee
				menuDepth = -1;	
			}
			break;
			
		case 1:
			var rewards = {
				rewardExp : getEnemySpoils(SPOILS.ex),
				rewardMoney : getEnemySpoils(SPOILS.gold)				
			}
			// Results menu
			instance_create_depth(global.dungeonPixelWidth/2, global.dungeonPixelHeight/2, depth - 100, obj_battleResults, rewards);
			// Win text
			instance_create_depth(global.dungeonPixelWidth, 0, depth - 100, obj_winText);
			
			stopBattleTheme();
			winSFX();
			menuDepth++;
			break;
			
		case 2:
			// Wait for menus to disappear
			if (!instance_exists(obj_battleResults) && !instance_exists(obj_winText)){
				menuDepth = -1;
			}
			
			break;
			
		case 3:
			// battle lost, slowly fade out. Taken to game over room when done
			global.tips = [];
			loseFadeAlpha += 0.0055;
			audio_master_gain((1 - loseFadeAlpha));
			if (loseFadeAlpha > 1){
				stopBattleTheme();
				audio_master_gain(1);
				if (bossBattle){
					editForwardWall(0, PALETTE.doorClosed);
				}
				room_goto(rm_gameOver);	
			}
			break;
	}
	
	exit;	
}


// Player turn
if (playerTurn){
	switch (menuDepth){
		case -1:
			menuDepth = 0;
			playerDefending = false;
			//playerTurn = false;
			
			// player defeat
			if (global.playerHP <= 0){
				battleOver = true;
				exit;
			}
			
			instance_create_depth(0, 0, -30, obj_battleWheel, {creatorID : id});
			if (!turnIconCreated){
				instance_create_layer(global.dungeonPixelWidth, 0, "Enemy", obj_playerTurn);
				turnIconCreated = true;	
			}
			global.tips = ["[Z] - Confirm"];
			break;
			
		case 1:
			switch (menuCategory){					
				case BATTLE.skill:
					if (!instance_exists(obj_skillMenu)){
						global.tips = ["[X] - Cancel", "[Z] - Confirm"];
						instance_create_layer(global.dungeonPixelWidth, 0, "Instances", obj_skillMenu, {creatorID: id, currentIndex: skillMemory, bubbleX: x - sprite_width/2, bubbleY: y - sprite_height});
					}
					break;
					
				case BATTLE.item:					
					if (!instance_exists(obj_itemMenu)){
						global.tips = ["[X] - Cancel", "[Z] - Confirm"];
						instance_create_layer(global.dungeonPixelWidth, 0, "Instances", obj_itemMenu, {creatorID: id, currentIndex: itemMemory});
					}
					break;
					
				case BATTLE.defend:
					tryCreateTargeter(true, "Defend?");
					textBoxTimer = 0;
					break;
					
				case BATTLE.flee:
					if (bossBattle) {
						menuDepth = -1;
						break;
					}
					tryCreateTargeter(true, "Attempt to flee?");
					textBoxTimer = 0;
					break;
					
				case BATTLE.analyze:
					menuDepth = -1;
					break;
			}
			break;
			
		case 2:
			switch (menuCategory){				
				
				case BATTLE.defend:
					pushContent("Began to guard!", false, false, 2, 3);
					
					playerDefending = true;
					
					handleTextBoxTimer(90, true, 3);
					
					break;
				
				case BATTLE.flee:
					pushContent("Trying to flee...", false, false, 2, 3);
					
					handleTextBoxTimer(90, true, 3);
					
					if (menuDepth == 3){
						// flee check
						fleeSucceed = skillCheck(25, 75, getPlayerStat(STATS.ag) + getPlayerStat(STATS.lu)/2, getEnemyStat(STATS.ag) + getEnemyStat(STATS.lu)/2);
					}
					break;
			}
			break;
			
		case 3:
			switch (menuCategory){
				
				case BATTLE.skill:
					if (performSkill(selectedSkill)) endPlayerTurn();
					break;
					
				case BATTLE.item:
					if (useItem()) endPlayerTurn();
					//textBoxTimer = 0;
					break;
				
				case BATTLE.defend:
					endPlayerTurn();
					break;
				
				case BATTLE.flee:
					// show message based on flee work
					if (fleeSucceed){
						menuDepth = pushContent("Got away!", true, false, 3, 4);
						beginFade = true;
					}
					else {
						menuDepth = pushContent("Couldn't get away!", true, false, 3, 4);
					}
					break;
			}
			break;
			
		case 4:
			switch (menuCategory){					
				case BATTLE.skill:
					if (performSkill(selectedSkill)) endPlayerTurn();
					break;
					
				case BATTLE.item:
					if (useItem()) endPlayerTurn();
					break;
				
				case BATTLE.flee:
					// end battle if flee-ed
					if (fleeSucceed){
						battleOver = true;
						menuDepth = 0;
						stopBattleTheme();
						exit;
					}
					else {
						endPlayerTurn();
						exit;
					}
					break;
			}
			break;
		
	}	
}

// Enemy Turn
else {
	//playerTurn = true;
	switch (menuDepth) {
		case -1:
			
			menuDepth = 0;
			if (global.enemyHP <= 0){
				battleOver = true;
				exit;
			}
			
			// create enemy turn banner
			instance_create_layer(global.dungeonPixelWidth, 0, "Enemy", obj_enemyTurn);
			
			break;
			
		case 0:
			// wait for banner to disappear
			if (!instance_exists(obj_enemyTurn)){
				menuDepth = 1;
				// choose skill
				selectedSkill = enemyChooseSkill(global.loadedEnemy);
			}
			break;
			
		case 1:
			// if (performSkill(selectedSkill)) endEnemyTurn();
			// specific move test
			if (performSkill(selectedSkill)) endEnemyTurn();
			break;
		
		default:
			endEnemyTurn();
			break;
	}
}




