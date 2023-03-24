/// @description Insert description here
// You can write your code in this editor
if (targeted){
	var col = 175 + 80 * sin(pulseTimer / 10 * pi);
	draw_sprite_pos_fixed(sprite_index, image_index, left, top, left+size, top, left+size, top+size, left, top+size, make_color_rgb(col, col, col), 1);
}
else {
	draw_sprite_pos(sprite_index, image_index, left, top, left+size, top, left+size, top+size, left, top+size, 1);
}










