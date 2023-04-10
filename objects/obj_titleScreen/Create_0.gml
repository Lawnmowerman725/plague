/// @description Insert description here
// You can write your code in this editor
backColor = #77B4CE;

playerName = "";

profileImages = [
	spr_profile1,
	spr_profile2,
	spr_profile3
];

classes = [
	global.classDatabase[1],
	global.classDatabase[2]
];

function createPage4(){
	stepX = global.dungeonPixelWidth / (array_length(profileImages) + 1);
	for (var i = 0; i < array_length(profileImages); i++){
		instance_create_depth(stepX * (i+1), global.dungeonPixelHeight * 0.5, depth - 10, obj_profileButton, {myIndex: i, mySprite: profileImages[i]});
	}
}

function createPage5(){
	stepX = global.dungeonPixelWidth / (array_length(classes) + 1);
	instance_create_depth(stepX, global.dungeonPixelHeight * 0.34, depth - 10, obj_classButton, {myIndex: 1, mySprite: spr_profile1});
	instance_create_depth(stepX * 2, global.dungeonPixelHeight * 0.34, depth - 10, obj_classButton, {myIndex: 2, mySprite: spr_profile2});
}

function nextPage(){
	switch (page){
		case 3:
			page = 4;
			createPage4();
			break;
			
		case 4:
			page = 5;
			createPage5();
			instance_destroy(obj_profileButton);
			break;
			
		case 5:
			page = 6;
			instance_destroy(obj_classButton);
			break;
			
		case 6:
			nextButton.enabled = false;
			backButton.enabled = false;
			// assign player stuff
			global.player.myName = playerName;
			global.player.portrait = profileImages[selectedProfile];
			global.player.class = selectedClass;
			
			doRecovery(true, 1, true, true)
			doRecovery(true, 1, true, false)
			introTimer++;
			break;
	}
}

function previousPage(){
	switch (page){
		case 4:
			page = 3;
			keyboard_string = playerName;
			instance_destroy(obj_profileButton);
			break;
		case 5:
			page = 4;
			createPage4();
			instance_destroy(obj_classButton);
			break;
		case 6:
			page = 5;
			createPage5();
			break;
	}
}

global.dungeonMoney = 0;
global.player = new PlayerFile();
global.dungeonFloor = 0;
resetInventory();