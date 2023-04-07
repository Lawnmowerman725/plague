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

if (currentIndex > array_length(validItems)-1){
	currentIndex = array_length(validItems)-1;
}

var selectedStruct = validItems[currentIndex];
descriptionBox = instance_create_depth(global.dungeonPixelWidth * 0.05, global.dungeonPixelHeight * 0.7, depth - 20, obj_descriptionBox, {category : DROPS.consumables, myStruct : selectedStruct});


for (var i = 0; i < array_length(validItems); i++){
		var myY = yPositionFormula(i);
		array_push(itemMenuList, instance_create_layer(xPositionFormula(myY), myY, "Enemy", obj_itemMenuBlock, {myIndex: i, item: validItems[i]}));
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