/// @description Insert description here
// You can write your code in this editor

// Draw bar
draw_set_alpha(1);
draw_set_color(barCol);
draw_rectangle(x - sprite_width/2 + left, y - sprite_height + top, x - sprite_width/2 + left + percent * max_width, y - sprite_height + bottom, false);

// Draw missing portion
if (damagePercent != 0){
	if (heal){
		draw_set_color(healCol);	
	}
	else {
		draw_set_color(damCol);
	}
	
	draw_rectangle(x - sprite_width/2 + left + damagePartX, y - sprite_height + top, x - sprite_width/2 + left + damagePartX + damagePercent * max_width, y - sprite_height + bottom, false);
	
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #FFFFFF, 1);