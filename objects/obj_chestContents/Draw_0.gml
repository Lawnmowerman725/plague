/// @description Insert description here
// You can write your code in this editor

if (spriteVisible){
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #fc1c76, 1);	
}
else {
	draw_set_color(myColor);
	draw_set_alpha(0.7);
	draw_circle(x, y, radiusSize(), false);
	draw_set_alpha(1);
}