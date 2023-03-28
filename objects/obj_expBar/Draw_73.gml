/// @description Insert description here
// You can write your code in this editor

// Background
draw_sprite(spr_expBarBack, 0, x, y);

// Draw bar
draw_sprite_part(sprite_index, image_index, 0, 0, sprite_width * barPercent, sprite_height, x, y);