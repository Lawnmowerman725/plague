
pulseTimer = ((pulseTimer + 5/6)) % 20;

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
	
	if (shakePos = 0) shakePos = -15;
	
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
			playBattleTheme();
		}
		yOff -= 30;	
	
	} else {
		menuDepth = pushContent(global.loadedEnemy.myName + " appeared!", true);
		if (menuDepth == 1){
			introOver = true;
			menuDepth = -1;
		}
	
	}
	exit;
}

// End of battle
if (battleOver) {
	if (global.enemyHP <= 0) visibilityTimer = 100;
	global.tips = [];
	
	switch (menuDepth){
		case -1:
			if (beginFade) exit;
			instance_destroy(id);
			audio_stop_sound(snd_battleWin);
			exit;
			break;
			
		case 0:
			if (global.enemyHP <= 0){
				menuDepth = pushContent(global.loadedEnemy.myName + " defeated!", true, false, 0, 1);
			}
			else {
				menuDepth = -1;	
			}
			break;
			
		case 1:
			menuDepth = pushContent("Gained " + string(getEnemySpoils(SPOILS.ex)) + " experience and "  + string(getEnemySpoils(SPOILS.gold)) + " cheese.", true, false, 1, 2);
			break;
			
		case 2:
			global.experience += getEnemySpoils(SPOILS.ex);
			global.dungeonMoney += getEnemySpoils(SPOILS.gold);
			levelCheck = (global.experience >= power(global.playerLevel+1, 3));
			
			if (levelCheck) {
				updateLevel();
				menuDepth = 3;
				break;
				
			}
			menuDepth = -1;
			break;
			
		case 3:
			menuDepth = pushContent("Level Up!", true, false, 3, -1);
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
			/*
			if (global.enemyHP <= 0){
				battleOver = true;
				winSFX();
				stopBattleTheme();
				exit;
			}*/
			instance_create_depth(0, 0, -30, obj_battleWheel, {creatorID : id});
			if (!turnIconCreated){
				instance_create_layer(global.dungeonPixelWidth, 0, 0, obj_playerTurn);
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
					tryCreateTargeter(true, "Attempt to flee?");
					textBoxTimer = 0;
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
					tryCreateTargeter(determineTarget(global.skillDatabase[selectedSkill]), "Use " + global.skillDatabase[selectedSkill].myName + "?");
					textBoxTimer = 0;
					break;
					
				case BATTLE.item:
					tryCreateTargeter(determineItemTarget(item), "Use " + item.myName + "?");
					textBoxTimer = 0;
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
					if (useItem(item)) endPlayerTurn();
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
	playerTurn = true;	
}




