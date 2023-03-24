/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x+5 + offset * -2, y+5, 1.1, 1.1, 0, #000000, 1 - abs(offset)/40);
draw_sprite_ext(sprite_index, image_index, x-5 + offset * -2, y-5, 1.1, 1.1, 0, make_color_hsv(irandom_range(162, 192), irandom_range(28, 203), 255), 1 - abs(offset)/40);