/// @description Insert description here
// You can write your code in this editor
if (realIntro > 0) exit;

if (fxTimer > 0) {
	fxTimer--;
	layer_enable_fx("Instances", (fxTimer > 0));
}

if (page > 0 && cloudYOff > 0){
	cloudYOff -= 2;
	if (cloudYOff < 0){
		cloudYOff = 0;	
	}
}

// move clouds
row1Off = (row1Off + 1) % 316;
row2Off = (row2Off + 1.5) % 316;
row3Off = (row3Off + 2) % 316;
row4Off = (row4Off + 2.5) % 316;

switch (page){
	
	case 1:
		if (!instance_exists(obj_lightning)){
			backColor = #3A4366;
			fxTimer = 30;
			page = 1.5;
		}
		break;
		
	case 1.5:
		initialWait -= 1;
		if (initialWait < 0){
			page = 2;	
		}
		break;
		
	case 2:
		// fade to black
		if (backAlpha < 0.65){
			backAlpha += 0.005;
			if (backAlpha >= 0.65){
				page = 3;
				// initialize keyboard stuffs
				nextButton = instance_create_depth(global.dungeonPixelWidth * 0.93, global.dungeonPixelHeight-50, depth - 10, obj_nextBackButton, {backButton : false});
				backButton = instance_create_depth(global.dungeonPixelWidth * 0.07, global.dungeonPixelHeight-50, depth - 10, obj_nextBackButton, {backButton : true});
				keyboard_string = "";
			}
		}
		break;
		
	case 3:
		// player name
		if (string_length(keyboard_string) > 16)
		{
			keyboard_string = string_copy(keyboard_string, 1, 16);
		}
		playerName = keyboard_string;
		
		nextButton.enabled = (playerName != "");
		backButton.enabled = false;
		break;
		
	case 4:
		// profile images
		nextButton.enabled = true;
		backButton.enabled = true;
		break;
		
	case 5:
		// classes
		nextButton.enabled = true;
		backButton.enabled = true;
		break;
		
	case 6:
		// controls
		
		break;
}