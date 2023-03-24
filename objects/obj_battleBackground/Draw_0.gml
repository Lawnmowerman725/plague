/// @description Insert description here
// You can write your code in this editor
for (var i = -2; i <= 2; i++){
	for (var j = -2; j <= 2; j++){
		draw_sprite_ext(sprite_index, 0, x + xOffset + i * sprite_width, y + yOffset + j * sprite_height, 1, 1, 0, myColor, 1);
	}
}

draw_sprite_ext(spr_battleBackDepth, 0, 0, 0, 1, 1, 0, #FFFFFF, 1);