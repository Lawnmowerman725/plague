/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #FFFFFF, 1);
draw_sprite_ext(sprite_index, image_index, x, y, 1, -1, 0, #FFFFFF, 1);

if (image_speed == 0){
	// draw message
	draw_set_alpha(1);
	draw_set_color(#FFFFFF);
	draw_set_font(fnt_sideLevel);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(x, y, myMessage);
	
	//drawToolTip();
}