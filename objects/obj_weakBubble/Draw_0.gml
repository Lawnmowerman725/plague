/// @description Insert description here
// You can write your code in this editor

// if enemy does not have weaknesses
if (array_length(iconList) == 0) exit;

// Background
draw_sprite_ext(sprite_index, image_index, x, y, 1, scale, 0, #FFFFFF, 1);

// sprite icons
var startX = x - sprite_width/2;
var startY = y - 90;

for (var i = 0; i < array_length(iconList); i++){
	draw_sprite_ext(spr_elementIcons, iconList[i], startX, startY, 1, 1, 0, #000000, 0.5);
	startY -= 80;
}