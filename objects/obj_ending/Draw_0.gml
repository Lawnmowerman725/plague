/// @description Insert description here
// You can write your code in this editor

// background
draw_set_alpha(1)
draw_set_color(make_color_hsv(0, 0, brightness * 255));
draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);

switch (phase){

	case 0:
		draw_set_color(#000000);
		draw_rectangle(0 - doorOff, 0, doorWidth - doorOff, global.dungeonPixelHeight, false);
		draw_rectangle(doorWidth + doorOff, 0, global.dungeonPixelWidth + doorOff, global.dungeonPixelHeight, false);
		break;
		
	case 1:
		draw_set_alpha(thanksFade);
		var maxOffset = 75;
		
		// thank you text
		draw_set_color(#000000);
		draw_set_font(fnt_biggest);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.32 + maxOffset * (1-thanksFade), "Thank you for playing the");
		
		// logo
		draw_sprite(sprite_index, image_index, global.dungeonPixelWidth*0.5 - sprite_width/2, global.dungeonPixelHeight * 0.4 + maxOffset * (1-thanksFade))
		
		// demo
		draw_text(global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.69 + maxOffset * (1-thanksFade), "Demo!");
		break;
		
	case 2:
		draw_set_alpha(thanksFade);
		var maxOffset = 75;
		
		// thank you text
		draw_set_color(#000000);
		draw_set_font(fnt_biggest);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.32 - maxOffset * (1-thanksFade), "Thank you for playing the");
		
		// logo
		draw_sprite(sprite_index, image_index, global.dungeonPixelWidth*0.5 - sprite_width/2, global.dungeonPixelHeight * 0.4 - maxOffset * (1-thanksFade))
		
		// demo
		draw_text(global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.69 - maxOffset * (1-thanksFade), "Demo!");
		break;
		
	case 3:
		// checkerboard
		draw_set_alpha(1);
		draw_sprite_ext(spr_checkerboardPattern, 0, checkerHOff, -108 + checkerboardOff, 1, 12, 0, #FFFFFF, 1);
		
		// featuring text
		draw_set_color(#CCCCCC);
		draw_set_font(fnt_biggest);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(global.dungeonPixelWidth * 0.25 + checkerHOff, global.dungeonPixelHeight * 0.12, "Featuring");
		draw_line_width(global.dungeonPixelWidth * 0.1 + checkerHOff, global.dungeonPixelHeight* 0.18, global.dungeonPixelWidth * 0.4 + checkerHOff, global.dungeonPixelHeight* 0.18, 10);
		
		// player name
		draw_text_transformed(global.dungeonPixelWidth * 0.25 + checkerHOff, global.dungeonPixelHeight * 0.3, global.player.myName, 0.8, 0.8, 0);
		
		// profile pic
		var size = 150;
		var cX = checkerHOff + global.dungeonPixelWidth * 0.25;
		var cY = global.dungeonPixelHeight * 0.52;
		draw_sprite_pos(global.player.portrait, 0, cX - size, cY - size, cX + size, cY - size, cX + size, cY + size, cX - size, cY + size, 1);
		
		// level
		draw_text_transformed(global.dungeonPixelWidth * 0.25 + checkerHOff, global.dungeonPixelHeight * 0.72, "LV " + string(global.playerLevel), 0.7, 0.7, 0);
		
		// class
		draw_text_transformed(global.dungeonPixelWidth * 0.25 + checkerHOff, global.dungeonPixelHeight * 0.78, string(getClass().myName), 0.7, 0.7, 0);
		
		// moners
		draw_text_transformed(global.dungeonPixelWidth * 0.25 + checkerHOff, global.dungeonPixelHeight * 0.89, "$" + string(global.dungeonMoney), 1, 1, 0);
		
		
		// br logo
		draw_sprite_ext(spr_plagueLogo, 0, global.dungeonPixelWidth *0.81 - checkerHOff, global.dungeonPixelHeight * 0.91, 0.3, 0.3, 0, #FFFFFF, 1)
		
		// made by text
		draw_set_color(#000000);
		draw_text(global.dungeonPixelWidth * 0.75 - checkerHOff, global.dungeonPixelHeight * 0.12, "Made by");
		draw_line_width(global.dungeonPixelWidth * 0.6 - checkerHOff, global.dungeonPixelHeight* 0.18, global.dungeonPixelWidth * 0.9 - checkerHOff, global.dungeonPixelHeight* 0.18, 10);
		
		// pineapple soda studios
		draw_text_transformed(global.dungeonPixelWidth * 0.75 - checkerHOff, global.dungeonPixelHeight * 0.3, "Pineapple Soda Studios", 0.8, 0.8, 0);
		draw_line_width(global.dungeonPixelWidth * 0.65 - checkerHOff, global.dungeonPixelHeight* 0.35, global.dungeonPixelWidth * 0.85 - checkerHOff, global.dungeonPixelHeight* 0.35, 6);
		
		// colby heaton
		draw_text_transformed(global.dungeonPixelWidth * 0.75 - checkerHOff, global.dungeonPixelHeight * 0.42, "Colby Heaton", 0.7, 0.7, 0);
		// collin heaton? 0_0 i meannnn unless 0_<
		draw_text_transformed(global.dungeonPixelWidth * 0.75 - checkerHOff, global.dungeonPixelHeight * 0.52, "Collin Fluke", 0.7, 0.7, 0);
		
		// lead actor
		draw_text_transformed(global.dungeonPixelWidth * 0.75 - checkerHOff, global.dungeonPixelHeight * 0.68, "Lead Actor", 0.8, 0.8, 0);
		draw_line_width(global.dungeonPixelWidth * 0.65 - checkerHOff, global.dungeonPixelHeight* 0.73, global.dungeonPixelWidth * 0.85 - checkerHOff, global.dungeonPixelHeight* 0.73, 6);
		// that guy
		draw_text_transformed(global.dungeonPixelWidth * 0.75 - checkerHOff, global.dungeonPixelHeight * 0.8, "Maximillian Yagoobian Brushel Chu the Third", 0.7, 0.7, 0);
		
		break;

}

draw_set_alpha(1);
