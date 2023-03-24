/// @description Insert description here
// You can write your code in this editor

function xPositionFormula(_y){
	return -0.0805555 * _y + global.dungeonPixelWidth - 163;
}

function yPositionFormula(_index){
	return 200 * _index + global.dungeonPixelHeight/2;
}

itemMenuList = [];

// Get items with more than 1 item
validItems = [];
for (var i = 0; i < array_length(global.consumableDatabase); i++){
	if (hasItem(global.consumableDatabase[i].myName)){
		array_push(validItems, global.consumableDatabase[i]);
	}
}
// if no items
if (array_length(validItems) == 0){
	creatorID.menuDepth = -1;
	instance_destroy(id);
	exit;	
}

for (var i = 0; i < array_length(validItems); i++){
		var myY = yPositionFormula(i);
		array_push(itemMenuList, instance_create_layer(xPositionFormula(myY), myY, "Enemy", obj_itemMenuBlock, {myIndex: i, item: validItems[i]}));
}