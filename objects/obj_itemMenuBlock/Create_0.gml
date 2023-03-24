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

switch (item.formula){
	case "HPUP":
	case "HP":
		myColor = ITEM.hp;
		break;
		
	case "REVIVE":
		myColor = ITEM.misc;
		useable = false;
		break;
		
	case "UP":
		myColor = ITEM.up;
		break;
		
	case "SELL":
		myColor = ITEM.money;
		useable = false;
		break;
}

scale = getScale(y);