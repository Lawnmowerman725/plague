/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #2c58db, 1);

if (array_length(itemMenuList) <= 5) exit;

draw_sprite_part_ext(sprite_index, image_index, 0, top, sprite_width, height, x-sprite_width, top, 1, 1, #000000, 0.2);