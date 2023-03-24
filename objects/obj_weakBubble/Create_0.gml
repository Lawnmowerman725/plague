/// @description Insert description here
// You can write your code in this editor
iconList = [];

for (var i = 7; i >= 0; i--){
	if (global.loadedEnemy.elementDefend[i] > 1.1){
		array_push(iconList, i);
	}
}

scale = 1 + (array_length(iconList)-1) * 80 / sprite_height;

if (y - scale * sprite_height < 30){
	y = 30 + scale * sprite_height;
	
}