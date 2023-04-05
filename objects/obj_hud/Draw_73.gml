/// @description Insert description here
// You can write your code in this editor

//draw_sprite_ext(spr_idleHud, 0, 0, 0, 1.2, 2, 0, #FFFFFF, 1)

drawHudWander(x + shakePos, y+sprite_height, x+sprite_width);

draw_sprite(sprite_index, image_index, x + shakePos, y);

// draw key
if (global.exitOpen || keyXVel != 0){
	draw_sprite_ext(spr_keyIcon, 0, keyX+6, keyY+6, 1.5, 1.5, 0, #000000, 1);
	draw_sprite_ext(spr_keyIcon, 0, keyX, keyY, 1.5, 1.5, 0, #ffec8f, 1);	
}
