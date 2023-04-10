/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_color(backColor);
draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);

// farthest back cloud
draw_sprite_ext(spr_cloud, 0, -316 + row1Off, 280 - cloudYOff, -10, 1, 0, #777777, 1);

draw_self();

draw_sprite_ext(spr_cloud, 0, -316 + row2Off, 210 - cloudYOff, -10, 1, 0, #999999, 1);
draw_sprite_ext(spr_cloud, 0, -316 + row3Off, 140 - cloudYOff, -10, 1, 0, #BBBBBB, 1);
draw_sprite_ext(spr_cloud, 0, -316 + row4Off, 70 - cloudYOff, -10, 1, 0, #DDDDDD, 1);

draw_set_alpha(backAlpha);
draw_set_color(#000000);
draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
draw_rectangle(0, 0, global.dungeonPixelWidth, 100, false);
draw_rectangle(0, global.dungeonPixelHeight-100, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
draw_set_alpha(1);

switch (page){
	case 0:
		draw_sprite(spr_plagueLogo, 0, 150, 120);
		draw_set_font(fnt_bigger);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		drawTextShadow("- Click Anywhere to Begin -", 150, global.dungeonPixelHeight*0.38, #222222, 1, 5, 5, #CCCCCC, 0);
		break;
		
	case 3:
		// player name
		
		// prompt
		draw_set_alpha(1);
		draw_set_color(#CCCCCC)
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_biggest);
		
		draw_text_transformed(global.dungeonPixelWidth*0.1, 50, "What is your name?", 0.6, 0.6, 0);
		
		// directions
		draw_set_halign(fa_center);
		draw_set_font(fnt_bigger);
		draw_text(global.dungeonPixelWidth*0.5, global.dungeonPixelHeight - 50, "Please use the keyboard.   Click \"Next\" when finished.");
		
		// the line
		draw_line_width(global.dungeonPixelWidth * 0.1, global.dungeonPixelHeight * 0.55, global.dungeonPixelWidth * 0.9, global.dungeonPixelHeight * 0.55, 10);
		
		// bottom text
		draw_set_color(#777777)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(global.dungeonPixelWidth * 0.1, global.dungeonPixelHeight * 0.58, "YOUR NAME");
		
		// name
		draw_set_valign(fa_bottom);
		draw_set_font(fnt_biggest);
		if (playerName == ""){
			draw_text(global.dungeonPixelWidth * 0.1, global.dungeonPixelHeight * 0.52, "Begin Typing...");
		}
		else {
			draw_set_color(#CCCCCC);
			draw_text(global.dungeonPixelWidth * 0.1, global.dungeonPixelHeight * 0.5, playerName);
		}
		
		
		break;
		
	case 4:
		// profile image
		
		// prompt
		draw_set_alpha(1);
		draw_set_color(#CCCCCC)
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_biggest);
		
		draw_text_transformed(global.dungeonPixelWidth*0.1, 50, "Please choose a profile image.", 0.6, 0.6, 0);
		
		// directions
		draw_set_halign(fa_center);
		draw_set_font(fnt_bigger);
		draw_text(global.dungeonPixelWidth*0.5, global.dungeonPixelHeight - 50, "Click on an image to select it.");
		
		// highlight
		draw_sprite(spr_selectedProfile, 0, stepX * (selectedProfile + 1), global.dungeonPixelHeight*0.5);
		
		break;
		
	case 5:
		// classes
		
		// prompt
		draw_set_alpha(1);
		draw_set_color(#CCCCCC)
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_biggest);
		
		draw_text_transformed(global.dungeonPixelWidth*0.1, 50, "Please choose a class for your adventurer.", 0.6, 0.6, 0);
		
		// class name
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(#FFFFFF)
		draw_set_font(fnt_biggest);
	
		draw_text_transformed(global.dungeonPixelWidth*0.5, global.dungeonPixelHeight*0.65, classes[selectedClass-1].myName, 1, 1, 0);
		
		// class description
		draw_set_font(fnt_bigger);
		draw_set_valign(fa_top);
		draw_set_color(#CCCCCC)
		draw_text_ext(global.dungeonPixelWidth*0.5, global.dungeonPixelHeight*0.75, classes[selectedClass-1].description, 40, global.dungeonPixelWidth * 0.8);
		
		// da line
		draw_line_width(global.dungeonPixelWidth * 0.35, global.dungeonPixelHeight * 0.7, global.dungeonPixelWidth * 0.65, global.dungeonPixelHeight * 0.7, 8);
		
		
		// directions
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_bigger);
		draw_text(global.dungeonPixelWidth*0.5, global.dungeonPixelHeight - 50, "Click on a class to select it.");
		
		// highlight
		draw_sprite(spr_selectedProfile, 0, stepX * (selectedClass), global.dungeonPixelHeight*0.34);
		
		break;
		
	case 6:
		// controls
		
		// prompt
		draw_set_alpha(1);
		draw_set_color(#CCCCCC)
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_biggest);
		
		draw_text_transformed(global.dungeonPixelWidth*0.1, 50, "Controls", 0.6, 0.6, 0);
		
		draw_sprite(spr_controls, 0, 0, 0);
		
		// directions
		draw_set_halign(fa_center);
		draw_set_font(fnt_bigger);
		draw_text(global.dungeonPixelWidth*0.5, global.dungeonPixelHeight - 50, "Click \"Next\" to enter the dungeon. Good luck!");
		break;
}