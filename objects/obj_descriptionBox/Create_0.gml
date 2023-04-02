/// @description Insert description here
// You can write your code in this editor
function tooWideCheck(_string){
	tooWideScale = 1;
	while(string_width(_string) * tooWideScale > 420){
		tooWideScale -= 0.03;
	}
}

myColor = #FFFFFF;

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
	switch (myStruct.formula){
		case "HPUP":
		case "HP":
			myColor = ITEM.hp;
			useable = true;
			break;
		
		case "REVIVE":
			myColor = ITEM.misc;
			useable = false;
			break;
		
		case "UP":
			myColor = ITEM.up;
			useable = true;
			break;
		
		case "SELL":
			myColor = ITEM.money;
			useable = false;
			break;
	}	
}

function skillColor(){
	myColor = elementColors[myStruct.element];
}