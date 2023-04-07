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

scale = getScale(y);

if (pauseMenu){
	useable = skill.formula == "HEAL"; 	
}