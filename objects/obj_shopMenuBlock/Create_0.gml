/// @description Insert description here
// You can write your code in this editor
function getScale(_y){
	return -power(_y-540, 2)/1000000 + 1
}

function tooWideCheck(_string){
	tooWideScale = 1;
	while(string_width(_string) * tooWideScale > 420){
		tooWideScale -= 0.03;
	}
}

itemColors = [
	#d9c46c, // HP
	#863AC4, // UP
	#e8ae6f, // MISC
	#e872b9, // DAMAGE
	#40c76f  // MONEY
];

elementColors = [
	#c2c2c2, // PHYS
	#ed6d6d, // FIRE
	#73aee6, // WATER
	#d9c46c, // ELEC
	#664b3d, // EARTH
	#71e86f, // WIND
	#e3e3e3, // HOLY
	#575757, // FORBID
	#82e8d2, // HEAL
	#e8b97b, // SUPPORT
	#c77be8, // AILMENT
	#c2c2c2, // PASSIVE
	#e8729d  // UNIQUE
];

function itemColor(){
	switch (item.formula){
		case "HPUP":
		case "HP":
			myColor = ITEM.hp;
			break;
		
		case "REVIVE":
			myColor = ITEM.misc;
			break;
		
		case "UP":
			myColor = ITEM.up;
			break;
		
		case "SELL":
			myColor = ITEM.money;
			break;
	}	
}

function useableCheck(){
	
	useable = (shopArr[SHOP.price] <= global.dungeonMoney);
	if (useable && shopArr[SHOP.category] == DROPS.skills){
		useable = !array_contains(global.player.skills, shopArr[SHOP.index]);
	}
}

function skillColor(){
	myColor = elementColors[myStruct.element];
}

scale = getScale(y);
useableCheck();