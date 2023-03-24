global.inBattle = false;

global.encounterTable = [
	[[0, 80], [1, 100]]
];

function tryEncounter(){
	//if (checkForwardWall()){
		instance_create_layer(global.dungeonPixelWidth/2, global.dungeonPixelHeight * 4/5, "Enemy", obj_battle);
	//}
	
}

function getEncounteredEnemy(){
	var floorIndex = 0;
	var encounters = global.encounterTable[floorIndex];
	var randomVal = random(100);
	var encounter = 0;
	
	for (var i = 0; i < array_length(encounters); i++){
		if (encounters[i][1] > randomVal){
			encounter = encounters[i][0];
			break;
		}
	}
	
	
	return encounter;
	
	
}