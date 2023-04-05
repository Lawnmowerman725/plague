/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(0.6);
draw_set_color(myColor);

draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
draw_set_alpha(1);


switch (phase){
	
	case 0:
		draw_set_color(#AAAAAA);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_biggest);
		
		draw_text(global.dungeonPixelWidth * 0.5, global.dungeonPixelHeight * 0.18, "- Paused -")
		
		draw_set_color(#DDDDDD);
		draw_set_halign(fa_left);
		
		var startingY = global.dungeonPixelHeight * 0.6 - ((array_length(pauseOptions)-1)/2 * optionSpacing);
		
		for (var i = 0; i < array_length(pauseOptions); i++){
			
			draw_text_transformed(left, startingY, pauseOptions[i], 0.8, 0.8, 0);
			
			// draw arrow
			if (i == index){
				draw_sprite_ext(spr_iconArrow, 0, left * 0.9 + sin(arrowTimer / 10 * pi) * 6, startingY, -0.8, 0.8, 0, #FFFFFF, 1)	
			}
			
			startingY += optionSpacing;
		}
		
		break;
	
}

