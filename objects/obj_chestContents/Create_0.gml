
myColor = #FFFFFF;

// Give player the chest contents
if (chestContents != 0){
	// break down chest contents
	category = chestContents[CHEST.category];
	index = chestContents[CHEST.index];
	quantity = chestContents[CHEST.quantity];
	
	// get the struct and also give it to the player
	switch (category){
		case DROPS.skills:
			chestStruct = global.skillDatabase[index];
			addSkill(index);
			break;
		case DROPS.consumables:
			chestStruct = global.consumableDatabase[index];
			alterItemCount(chestStruct.myName, quantity);
			break;
		case DROPS.key:
			chestStruct = global.keyStruct;
			break;
	}
}

function radiusSize(){
	return 40 + sin(pulseTimer / 10 * pi) * 20;	
}