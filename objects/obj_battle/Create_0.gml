// set position
x = global.dungeonPixelWidth/2
global.battleCursorMemory1 = 4;

// load the enemy's data
if (!bossBattle) {
	loadEnemy(getEncounteredEnemy(), global.dungeonFloor + 1);
}
else {
	loadEnemy(getForwardWallStoredValue(), global.dungeonFloor);
}

// weaknesses
//weaknesses = instance_create_layer(x - sprite_width/2, y - sprite_height, 0, obj_weakBubble);

// set my sprite
image_index = 0;
sprite_index = global.loadedEnemy.sprites.idle;

// enemy hp bar
healthBar = instance_create_depth(x, y - sprite_height - 10, depth-10, obj_enemyHealthBar);

// in battle
global.inBattle = true;
obj_textBox.override = true;

// stop dungeon theme
stopDungeonTheme();

// create background and tips
myBack = instance_create_layer(0, 0, "BattleBack", obj_battleBackground);
global.tips = [];

// creates the confirm text box
function tryCreateTargeter(_who, _message = ""){
	global.tips = ["[X] - Cancel", "[Z] - Confirm"];
	if (!instance_exists(obj_confirmTarget)){
		instance_create_layer(1500, 320, "Instances", obj_confirmTarget, {playerTarget: _who, myMessage: _message});	
	}
}

// used whenever the players turn ends
function endPlayerTurn(){
	playerTurn = false;
	menuDepth = -1;
	skillDepth = -1;
	skillBoxOver = false;
	totalDamage = 0;
	oneDamage = 0;
	turnIconCreated = false;
	//testSkillNum++;
}

function endEnemyTurn(){
	playerTurn = true;
	menuDepth = -1;
	skillDepth = -1;
	skillBoxOver = false;
	totalDamage = 0;
	oneDamage = 0;
	turnIconCreated = false;
	//testSkillNum++;
}

function determineTarget(_skill){
	var playerTarget = false;
	
	if (_skill.element == ELEMENTS.heal){
		playerTarget = true;
	}
	
	if (_skill.formula == "PASS"){
		playerTarget = true;		
	}
	
	return playerTarget;
}

function determineItemTarget(_item){
	var playerTarget = true;
	
	if (_item.formula == "DAMAGE"){
		playerTarget = false;
	}
	
	return playerTarget;
}

function useItem(){
	if (skillDepth == -1){
		alterItemCount(item.myName, -1);
		skillDepth = 0;
		global.tips = [];
	}
	
	switch (item.formula){
		
		case "HP":
		case "UP":
		case "HPUP":
			switch (skillDepth){
				case 0:
					skillDepth = 1;
					// create instance of item spotlight, pass in the item
					instance_create_depth(0, 0, depth - 20, obj_itemSpotlight, {myItem: item});
					break;
				case 1:
					if (!instance_exists(obj_itemSpotlight)){
						return true;	
					}
					break;
			}
			break;
		
		default:
			return true;
			break;
	}
	
	return false;
}

// holy shit
// cham
function performSkill(_skill){
	if (skillDepth == -1){
		skill = global.skillDatabase[_skill];
		if (playerTurn){
			global.playerUP = round(global.playerUP - skill.cost);
		}
		skillDepth = 0;
		global.tips = [];
	}
	
	switch (skill.formula){
		case "SCAD":
			// Strength, Critical, Accuracy, Defense
			
			// Show move name async
			if (!skillBoxOver){
				pushContent(skill.myName, false, false);
				handleTextBoxTimer(70, false, 0, false);
				goalDarkness = 0.4;
				if (textBoxTimer < 60) return false;
			}
			
			switch (skillDepth){
				case 0:
					
					skillDepth = 1;
					
					// Calculate stuffs
					if (playerTurn){
						// Player action
						accuracyCheck = skillCheck(skill.bAccuracy, skill.cAccuracy, getPlayerStat(STATS.ag) + getPlayerStat(STATS.lu)/2, getEnemyStat(STATS.ag) + getEnemyStat(STATS.lu)/2);
						critCheck = skillCheck(skill.bCritical, skill.cCritical, getPlayerStat(STATS.lu), getEnemyStat(STATS.lu));
						oneDamage = attackFormula(getPlayerStat(STATS.st), getEnemyStat(STATS.df), skill.powerMult, accuracyCheck, critCheck, getWeapon().affinities, global.loadedEnemy.elementDefend, skill.element);
					}
					else {
						// Enemy Action
						accuracyCheck = skillCheck(skill.bAccuracy, skill.cAccuracy, getEnemyStat(STATS.ag) + getEnemyStat(STATS.lu)/2, getPlayerStat(STATS.ag) + getPlayerStat(STATS.lu)/2);
						critCheck = skillCheck(skill.bCritical, skill.cCritical, getEnemyStat(STATS.lu), getPlayerStat(STATS.lu));
						oneDamage = attackFormula(getEnemyStat(STATS.st), getPlayerStat(STATS.df), skill.powerMult, accuracyCheck, critCheck, global.loadedEnemy.elementAttack, getArmor().affinities, skill.element)
					}
					
					totalDamage += oneDamage;
					
					if (!accuracyCheck) {
						// Miss
						skillDepth = 1.5;
						
						// Calc frame to dodge on
						frameToDodgeOn = skill.targetFrame;
						frameToDodgeOn *= 60 / sprite_get_speed(skill.mySprite);
						frameToDodgeOn -= 18;
					
						if (frameToDodgeOn <= 0){
							if (playerTurn) {
								goalDodge = -200;
							}
							missSFX();
							dodgeWaitCount = frameToDodgeOn;
						} else {
							// Create attack animation until impact
							skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite, fromEnemy: !playerTurn});
							dodgeWaitCount = 0;
						}
						
						break;
					}
					
					// Create attack animation until impact
					skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite, fromEnemy: !playerTurn});
					
					break;
					
				case 1:
					// If time to show number
					if (!instance_exists(skillAnim) || skillAnim.readyForNumber){
						
						if (global.enemyHP > 0) {
							instance_create_layer(global.dungeonPixelWidth/2, global.dungeonPixelHeight/2, "Instances", obj_flyingNumber, {myNumber: oneDamage, playerTurn: playerTurn});
							instance_create_layer(x - 70, y - sprite_height * 0.5, "Instances", obj_hitSplash, {playerTurn:playerTurn});
							if (playerTurn){
								shakeTimer = 16;						
							}
							else {
								obj_hud.shakeTimer = 16;
								with (myBack){
									fxTimer = 60;
								}
							}
							hitSFX();
							if (critCheck){
								critSFX();
								instance_create_layer(x, y - sprite_height - 50, "Instances", obj_criticalLabel);
								with (myBack){
									fxTimer = 80;
								}
							}
							
							if (playerTurn){
								enemyDealDamage(oneDamage);
							}
							else {
								playerDealDamage(oneDamage);
							}
							
							if (global.enemyHP <= 0){
								instance_create_depth(x, y, depth-20, obj_battleKnockAway, {sprite: sprite_index})	
							}
						}
						
						skillDepth = 2;
											
					}
					
					break;
					
				case 1.5:
					// Miss
					
					// Once animation hits
					if (instance_exists(obj_skillAnimation) && skillAnim.readyForNumber){
						instance_create_layer(x, y - sprite_height - 50, "Instances", obj_missLabel);
						skillDepth = 1.6;
					}
					
					if (frameToDodgeOn == 6969) exit;
					
					if (frameToDodgeOn <= 0){ // If need to dodge before anim starts
						if (dodgeWaitCount < 0){
							dodgeWaitCount++;	
						} else {
							// Create attack animation mid-dodge
							if (!instance_exists(obj_skillAnimation)){
								skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite, fromEnemy: !playerTurn});
								frameToDodgeOn = 6969;
							}
						}
					}
					else { // dodge happens mid-attack
						dodgeWaitCount++;
						if (dodgeWaitCount >= frameToDodgeOn) {
							if (playerTurn) {
								goalDodge = -200;
							}
							missSFX();
							frameToDodgeOn = 6969;
						}
					}
					
					
					break;
					
				case 1.6:
					if (!instance_exists(obj_missLabel)){
						goalDarkness = 0;
						return true;
					}
					break;
					
				case 2:
					// Wait for number to disappear
					if (!instance_exists(obj_flyingNumber)){
						skillDepth = 3;
						goalDarkness = 0;
						// Create total display
						instance_create_layer(x, y - sprite_height - 160, "Instances", obj_totalNumber, {enemyDamaged: playerTurn, myTotal: totalDamage});
					}
					break;
					
				case 3:
					// Wait for total number to disappear
					if (!instance_exists(obj_totalNumber)){
						return true;
					}
					break;
					
				default:
					return true;
			}
			
			break;
			
		case "MAG":
			// Magic, Accuracy, enemy magic Defense
			
			// Show move name async
			if (!skillBoxOver){
				pushContent(skill.myName, false, false);
				handleTextBoxTimer(70, false, 0, false);
				goalDarkness = 0.4;
				if (textBoxTimer < 60) return false;
			}
			
			switch (skillDepth){
				case 0:
					
					skillDepth = 1;
					
					// Calculate stuffs
					if (playerTurn){
						// Player action
						accuracyCheck = skillCheck(skill.bAccuracy, skill.cAccuracy, getPlayerStat(STATS.ag) + getPlayerStat(STATS.lu)/2, getEnemyStat(STATS.ag) + getEnemyStat(STATS.lu)/2);
						oneDamage = attackFormula(getPlayerStat(STATS.mg), getEnemyStat(STATS.mg), skill.powerMult, accuracyCheck, false, getWeapon().affinities, global.loadedEnemy.elementDefend, skill.element);
					}
					else {
						// Enemy Action
						accuracyCheck = skillCheck(skill.bAccuracy, skill.cAccuracy, getEnemyStat(STATS.ag) + getEnemyStat(STATS.lu)/2, getPlayerStat(STATS.ag) + getPlayerStat(STATS.lu)/2);
						oneDamage = attackFormula(getEnemyStat(STATS.mg), getPlayerStat(STATS.mg), skill.powerMult, accuracyCheck, false, global.loadedEnemy.elementAttack, getArmor().affinities, skill.element)
					}
					
					totalDamage += oneDamage;
					
					if (!accuracyCheck) {
						// Miss
						skillDepth = 1.5;
						
						// Calc frame to dodge on
						frameToDodgeOn = skill.targetFrame;
						frameToDodgeOn *= 60 / sprite_get_speed(skill.mySprite);
						frameToDodgeOn -= 18;
					
						if (frameToDodgeOn <= 0){
							if (playerTurn) {
								goalDodge = -200;
							}
							missSFX();
							dodgeWaitCount = frameToDodgeOn;
						} else {
							// Create attack animation until impact
							skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite,  element: skill.element, fromEnemy: !playerTurn});
							dodgeWaitCount = 0;
						}
						
						break;
					}
					
					// Create attack animation until impact
					skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite, element: skill.element, fromEnemy: !playerTurn});
					
					break;
					
				case 1:
					// If time to show number
					if (!instance_exists(skillAnim) || skillAnim.readyForNumber){
						
						if (global.enemyHP > 0){
							instance_create_layer(global.dungeonPixelWidth/2, global.dungeonPixelHeight/2, "Instances", obj_flyingNumber, {myNumber: oneDamage, playerTurn: playerTurn});
							if (playerTurn){
								shakeTimer = 16;						
							}
							else {
								obj_hud.shakeTimer = 16;
								with (myBack){
									fxTimer = 60;
								}
							}
							magicSFX();
							instance_create_layer(x - 70, y - sprite_height * 0.5, "Instances", obj_hitSplash, {playerTurn:playerTurn});
							with (myBack){
								fxTimer = 80;
							}
							if (playerTurn){
								enemyDealDamage(oneDamage);
							}
							else {
								playerDealDamage(oneDamage);
							}
							if (global.enemyHP <= 0){
								instance_create_depth(x, y, depth-20, obj_battleKnockAway, {sprite: sprite_index})	
							}
						
						}
						
						skillDepth = 2;
												
					}
					
					break;
					
				case 1.5:
					// Miss
					
					// Once animation hits
					if (instance_exists(obj_skillAnimation) && skillAnim.readyForNumber){
						instance_create_layer(x, y - sprite_height - 50, "Instances", obj_missLabel);
						skillDepth = 1.6;
					}
					
					if (frameToDodgeOn == 6969) exit;
					
					if (frameToDodgeOn <= 0){ // If need to dodge before anim starts
						if (dodgeWaitCount < 0){
							dodgeWaitCount++;	
						} else {
							// Create attack animation mid-dodge
							if (!instance_exists(obj_skillAnimation)){
								skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite, element: skill.element, fromEnemy: !playerTurn});
								frameToDodgeOn = 6969;
							}
						}
					}
					else { // dodge happens mid-attack
						dodgeWaitCount++;
						if (dodgeWaitCount >= frameToDodgeOn) {
							if (playerTurn) {
								goalDodge = -200;
							}
							missSFX();
							frameToDodgeOn = 6969;
						}
					}
					
					
					break;
					
				case 1.6:
					if (!instance_exists(obj_missLabel)){
						goalDarkness = 0;
						return true;
					}
					break;
					
				case 2:
					// Wait for number to disappear
					if (!instance_exists(obj_flyingNumber)){
						skillDepth = 3;
						goalDarkness = 0;
						// Create total display
						instance_create_layer(x, y - sprite_height - 160, "Instances", obj_totalNumber, {enemyDamaged: playerTurn, myTotal: totalDamage});
					}
					break;
					
				case 3:
					// Wait for total number to disappear
					if (!instance_exists(obj_totalNumber)){
						return true;
					}
					break;
					
				default:
					return true;
			}
			
			break;
			
		case "HEAL":
			// Moves that heal and nothing else
			
			// Show move name async
			if (!skillBoxOver){
				pushContent(skill.myName, false, false);
				handleTextBoxTimer(70, false, 0, false);
				goalDarkness = 0.4;
				if (textBoxTimer < 60) return false;
			}
			
			switch (skillDepth){
				case 0:
					
					skillDepth = 1;
					
					// Create attack animation until impact
					skillAnim = instance_create_layer(x, y - sprite_height/2, "Enemy", obj_skillAnimation, {targetFrame: skill.targetFrame, spriteName: skill.mySprite, element: skill.element, fromEnemy: playerTurn});
					
					break;
					
				case 1:
					// If time to show number
					if (!instance_exists(skillAnim) || skillAnim.readyForNumber){
						
						skillDepth = 2;
						
						// Calculate stuffs
						oneDamage = doRecovery((skill.powerMult <= 1), skill.powerMult, playerTurn);
						
						totalDamage += oneDamage;
						
						// Create total display
						if (playerTurn){
							instance_create_layer(533, 77, "Instances", obj_healNumber, {enemyDamaged: playerTurn, myTotal: string(totalDamage), hpVal: true});
						}
						else {
							instance_create_layer(x, y - sprite_height - 160, "Instances", obj_healNumber, {enemyDamaged: playerTurn, myTotal: string(totalDamage), hpVal: true});
						}
						
						
						magicSFX();
												
					}
					
					break;
								
				case 2:
					// Wait for number to disappear
					if (!instance_exists(obj_flyingNumber)){
						skillDepth = 3;
						goalDarkness = 0;
						
					}
					break;
					
				case 3:
					// Wait for total number to disappear
					if (!instance_exists(obj_healNumber)){
						return true;
					}
					break;
					
				default:
					return true;
			}
			
			break;
			
		case "PASS":
			return true;
		
		
	}
	
	// false means move incomplete
	return false;
}


function handleTextBoxTimer(_goal, _sendMe, _destination, _flash = true){
	if (_flash){
		with (obj_textBox){
			usePulse = true;	
		}
	}
	
	if (textBoxTimer < _goal){
		textBoxTimer++;
	}
	else{
		if (_sendMe) menuDepth = _destination;
		textBoxTimer = 0;
		skillBoxOver = true;
		with (obj_textBox){
			usePulse = false;
			content = "";
		}
	}
}