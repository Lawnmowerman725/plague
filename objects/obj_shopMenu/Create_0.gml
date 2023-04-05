/// @description Insert description here
// You can write your code in this editor

function xPositionFormula(_y){
	return -0.0805555 * _y + global.dungeonPixelWidth - 163;
}

function yPositionFormula(_index){
	return 200 * _index + global.dungeonPixelHeight/2;
}

function shopItemStruct(_index){
	// gets the struct from a shop item array	
	var returnStruct = {};
	var _shopArr = global.dungeonShop[_index];
	
	switch (_shopArr[SHOP.category]){
		case DROPS.consumables:
			returnStruct = global.consumableDatabase[_shopArr[SHOP.index]];
			break;
		case DROPS.skills:
			returnStruct = global.skillDatabase[_shopArr[SHOP.index]];
			break;
}
	
	return returnStruct;
}

function shopItemCategory(_index){
	return global.dungeonShop[_index][SHOP.category];	
}

var selectedStruct = shopItemStruct(currentIndex);
descriptionBox = instance_create_depth(global.dungeonPixelWidth * 0.05, global.dungeonPixelHeight * 0.7, depth - 20, obj_descriptionBox, {category : shopItemCategory(currentIndex), myStruct : selectedStruct});

itemMenuList = [];

for (var i = 0; i < array_length(global.dungeonShop); i++){
		var myY = yPositionFormula(i);
		array_push(itemMenuList, instance_create_layer(xPositionFormula(myY), myY, "Enemy", obj_shopMenuBlock, {myIndex: i, shopArr: global.dungeonShop[i], item: shopItemStruct(i)}));
}