/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #863AC4, 1);

if (array_length(skillMenuList) <= 5) exit;

draw_sprite_part_ext(sprite_index, image_index, 0, top, sprite_width, height, x-sprite_width, top, 1, 1, #000000, 0.2);

// draw weak or strong icon
var attackElem = global.skillDatabase[global.player.skills[currentIndex]].element;
if (attackElem < 8){
	// Weak
	if (global.loadedEnemy.elementDefend[attackElem] > 1.1){
		draw_sprite(spr_weakBubble2, 0, bubbleX, bubbleY);	
	}
	
	// Strong
	if (global.loadedEnemy.elementDefend[attackElem] < 0.9){
		draw_sprite(spr_strongBubble2, 0, bubbleX, bubbleY);	
	}
	
}