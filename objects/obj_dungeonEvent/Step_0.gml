// main loop
switch (phase) {
	
	// intro fade out
	case 0:	
		fadeTimer++;
		if (fadeTimer > maxFade) {
			phase = 1;
			sprite_index = backgroundSprite;
			drawMySprite = true;
			
			// if there's a subject sprite
			switch (myEvent){
				case WALL.chest:
					subjectSprite = spr_chestClosed;
					break;
				case WALL.emptyChest:
					subjectSprite = spr_chestOpened;
					break;
				case WALL.npc:
					subjectSprite = spr_author;
					subjectY = global.dungeonPixelHeight*0.9;
					break;
				case WALL.shop:
					shopKeeper = instance_create_depth(subjectX, subjectY,depth - 10, obj_shopkeeper);
					break;
			}
			
		}
		break;
		
	// fade into event
	case 1:
		fadeTimer--;
		if (fadeTimer <= 0){
			fadeTimer = 0;
			phase = 2;
		}
		break;
		
	// perform event
	case 2:
		if (performEvent()){
			phase = 3;
			global.tips = [];
		}
		break;
		
	// exit fade out
	case 3:	
		fadeTimer++;
		if (fadeTimer > maxFade) {
			phase = 4;
			drawMySprite = false;
			if (myEvent == WALL.shop){
				instance_destroy(shopKeeper);	
			}
		}
		break;
		
	// fade into dungeon
	case 4:
		fadeTimer--;
		if (fadeTimer <= 0){
			instance_destroy();
		}
		break;
}