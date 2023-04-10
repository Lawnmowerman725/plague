/// @description Insert description here
// You can write your code in this editor
draw_self();

if (phase == 2 || phase == 3){
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_font(fnt_biggest);
	
	if (phase == 2) {
		var startingY = global.dungeonPixelHeight * 0.6;
	
		for (var i = 0; i < array_length(gameOverOptions); i++){
			draw_set_color(#DDDDDD);
		
			draw_text_transformed(left, startingY, gameOverOptions[i], 0.8, 0.8, 0);
		
			// draw arrow
			if (i == index){
				draw_sprite_ext(spr_iconArrow, 0, left * 0.9 + sin(arrowTimer / 10 * pi) * 6, startingY, -0.8, 0.8, 0, #FFFFFF, 1)	
			}
			
			startingY += optionSpacing;
		}
	}
	
	// draw description
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(x, global.dungeonPixelHeight * 0.86, optionDesc[index], 100, 1700, 0.6, 0.6, 0);
	
	if (phase == 3){
		draw_text_transformed(global.dungeonPixelWidth * 0.5, global.dungeonPixelHeight * 0.62, "Are you sure?", 0.7, 0.7, 0);	
	}
}