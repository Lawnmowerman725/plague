backgroundSprite = getWallSprite(PALETTE.eventRoom);
if (myEvent == WALL.stairs) backgroundSprite = getWallSprite(PALETTE.stairs);

global.tips = [];

subjectX = global.dungeonPixelWidth/2;
subjectY = global.dungeonPixelHeight*0.65;

subjectSprite = pointer_null;

function performEvent(){

	// return true when event over
	
	switch(myEvent){
	
		// Stairs
		case WALL.stairs:
			
			switch (eventPhase) {
				case 0:
					// creates the text box
					var boxMess = [
						"You found the exit!",
						"Would you like to ascend?"
					]
					instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, pauseOnLast: true, creatorID: id});
					global.tips = ["[X] - Cancel", "[Z] - Confirm"];
					eventPhase = 1;
					break;
				case 1:
					// wait for box to be finished
					if (textBoxOver){
						instance_create_depth(global.dungeonPixelWidth * 0.7, global.dungeonPixelHeight * 0.55, depth-10, obj_yesNoBox, {creatorID: id});
						eventPhase = 2;
					}
					break;
				case 2:
					// wait for yes / no input
					if (!instance_exists(obj_yesNoBox)){
						instance_destroy(obj_dungeonTextBox);
						if (yesNoResult){
							// next floor
							fadeTimer++;
							if (fadeTimer > maxFade) {
								global.tips = [];
								room_goto(rm_floorTransition);
							}
							break;
						}
						else {
							// do not continue, return to current floor
							return true;
						}
					}
					break;
			}
			
			break;
			
		// Chest
		case WALL.chest:
			
			switch (eventPhase){
				case 0:
					// get chest contents
					chestContents = getForwardWallStoredValue();
					
					// creates the text box
					var boxMess = [
						"Open the chest?"
					]
					instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, pauseOnLast: true, creatorID: id});
					global.tips = ["[X] - Cancel", "[Z] - Confirm"];
					eventPhase = 1;
					break;
				
				case 1:
					// wait for box to be finished
					if (textBoxOver){
						instance_create_depth(global.dungeonPixelWidth * 0.7, global.dungeonPixelHeight * 0.55, depth-10, obj_yesNoBox, {creatorID: id});
						eventPhase = 2;
					}
					break;
				
				case 2:
					// wait for yes / no input
					if (!instance_exists(obj_yesNoBox)){
						instance_destroy(obj_dungeonTextBox);
						if (yesNoResult){
							// open chest
							eventPhase = 3;
							subjectSprite = spr_chestOpened;
							instance_create_depth(global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.65, depth - 10, obj_chestContents, {chestContents: chestContents});
							break;
						}
						else {
							// do not open, return to current floor
							return true;
						}
					}
					break;
					
				case 3:
					// wait for chest contents to finish whatever it does
					if (!instance_exists(obj_chestContents)){
						// clear contents by changing dungeon data to empty chest
						editForwardWall(1, WALL.emptyChest);
						return true;	
					}					
					break;
			}
			
			break;
		
		
		// Empty chest
		case WALL.emptyChest:
			
			switch (eventPhase){
				case 0:
					// creates the text box
					var boxMess = [
						"The chest is empty..."
					]
					instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, creatorID: id});
					global.tips = ["[X] - Cancel", "[Z] - Confirm"];
					eventPhase = 1;
					break;
				case 1:
					// wait for box to be finished
					if (!instance_exists(obj_dungeonTextBox)){
						return true;
					}
					break;
			}
			
			break;
		
		// Boss
		case WALL.boss:
			switch (eventPhase) {
				case 0:
					// creates the text box
					var boxMess = [
						"You feel an ominous presence.",
						"Will you stay here?"
					]
					instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, pauseOnLast: true, creatorID: id});
					global.tips = ["[X] - Cancel", "[Z] - Confirm"];
					eventPhase = 1;
					break;
				case 1:
					// wait for box to be finished
					if (textBoxOver){
						global.tips = [];
						instance_create_depth(global.dungeonPixelWidth * 0.7, global.dungeonPixelHeight * 0.55, depth-10, obj_yesNoBox, {creatorID: id});
						eventPhase = 2;
					}
					break;
				case 2:
					// wait for yes / no input
					if (!instance_exists(obj_yesNoBox)){
						instance_destroy(obj_dungeonTextBox);
						if (yesNoResult){
							// begin boss fight
							instance_create_layer(global.dungeonPixelWidth/2, global.dungeonPixelHeight * 4/5, "Enemy", obj_battle, {bossBattle : true});	
							eventPhase = 3;
							break;
						}
						else {
							// do not continue, return to current floor
							return true;
						}
					}
					break;
					
				case 3:
					// wait for battle to be over
					if (!instance_exists(obj_battle)){
						global.exitOpen = true;
						eventPhase = 4;
					}		
					if (battleStart < 100){
						battleStart++;
						if (battleStart > 100) battleStart = 100;
					}
					break;
				
				case 4:
					// fade out
					if (battleStart > 0){
						battleStart--;
						if (battleStart <= 0) {
							
							instance_destroy(obj_battleBackground);
	
							battleStart = 0;
							// creates the text box
							var boxMess = [
								"You got the floor key!"
							];
							instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, creatorID: id});
							global.tips = ["[X] - Cancel", "[Z] - Confirm"];
							eventPhase = 5;
						}
					}
					break;
				
				case 5:
					// wait for box to be finished
					if (!instance_exists(obj_dungeonTextBox)){
						return true;
					}
					break;
			}
			
			break;
		
		// NPC
		case WALL.npc:
			
			switch (eventPhase){
				case 0:
					// creates the text box
					var boxMess = getForwardWallStoredValue();
					instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, creatorID: id});
					global.tips = ["[X] - Cancel", "[Z] - Confirm"];
					eventPhase = 1;
					break;
				case 1:
					// wait for box to be finished
					if (!instance_exists(obj_dungeonTextBox)){
						return true;
					}
					break;
			}
			
			break;
			
		// Shop
		case WALL.shop:
			
			switch (eventPhase){
				case 0:
					shopKeeper.phase = 0;
					eventPhase = 1;
					break;
				case 1:
					if (shopKeeper.phase == 69){
						return true;
					}
					break;
			}
			
			break;
		
	}
	
	return false;
}