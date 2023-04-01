backgroundSprite = getWallSprite(PALETTE.eventRoom);
if (myEvent == WALL.stairs) backgroundSprite = getWallSprite(PALETTE.stairs);

global.tips = [];

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
		
	}
	
	return false;
}