global.inBattle = false;
global.encounterTable = [
	[0, 10], [1, 10]
];

function tryEncounter(){
	instance_create_layer(global.dungeonPixelWidth/2, global.dungeonPixelHeight * 4/5, "Enemy", obj_battle);	
}

function getEncounteredEnemy(){
	var encounters = global.encounterTable;
	
	var sum = 0;
	for (var i = 0; i < array_length(encounters); i++){
		sum += encounters[i][1];
	}
	
	var randomVal = random(sum);
	var encounter = 0;
	sum = 0;
	for (var i = 0; i < array_length(encounters); i++){
		sum += encounters[i][1];
		if (sum >= randomVal){
			encounter = encounters[i][0];
			i = array_length(encounters);
		}
	}
	
	
	return encounter;
	
	
}