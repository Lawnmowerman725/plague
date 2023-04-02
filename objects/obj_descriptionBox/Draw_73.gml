var top = y;
var left = x + 30;
var right = x + sprite_width - 30;

if (goBackwards && sprite_index != spr_descriptionBoxIntro){
	sprite_index = spr_descriptionBoxIntro;
	image_index = image_number - 1;
	image_speed = -1;
}

switch (category){
	
	case DROPS.skills:
		
		// Draw background
		skillColor();
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, myColor, 1);
		
		// Wait until intro over
		if (sprite_index == spr_descriptionBoxIntro) exit;
		
		// Draw element icon
		draw_sprite_ext(spr_elementIcons, myStruct.element, x + sprite_width - 80, y + sprite_height - 80, 2, 2, 0, #000000, 0.1);
		
		
		// Draw shadow text for skill name
		draw_set_alpha(1);
		draw_set_color(#000000);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_sideName);

		tooWideCheck(myStruct.myName);

		draw_text_transformed(left, top, myStruct.myName, tooWideScale, tooWideScale, 0);
		
		// Skill name
		draw_set_color(#FFFFFF);
		draw_text_transformed(left - 4, top - 4, myStruct.myName, tooWideScale, tooWideScale, 0);
		
		// Draw relevant info based on skill type
		switch (myStruct.formula){
			case "SCAD":
			case "MAG":
				// Draw shadow text for skill power
				draw_set_color(#000000);
				draw_set_halign(fa_right);
				draw_set_font(fnt_sideName);
				var powerString = string(myStruct.powerMult);
				draw_text_transformed(right, top, powerString, 1, 1, 0);
				draw_text_transformed(right - 110, top + 7, "POW", 0.6, 0.6, 0);
		
				// Skill power
				draw_set_color(#FFFFFF);
				draw_text_transformed(right - 4, top - 4,powerString, 1, 1, 0);
				draw_text_transformed(right - 113, top + 4, "POW", 0.6, 0.6, 0);
				break;
		}
		
		// Draw item description shadow
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(#000000);
		draw_set_font(fnt_sideLevel);
		var descriptionString = myStruct.description;
		top += 45;
		left = x + sprite_width * 0.1;
		draw_text_ext( left, top, descriptionString, 50, sprite_width * 0.8);
		
		// description
		draw_set_color(#FFFFFF);
		draw_text_ext(left - 3, top - 3, descriptionString, 50, sprite_width * 0.8);
		
		break;
		
	case DROPS.consumables:
		
		// update item color
		itemColor();
		
		// Draw background
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, itemColors[myColor], 1);
		
		// Wait until intro over
		if (sprite_index == spr_descriptionBoxIntro) exit;
		
		// Draw item icon
		draw_sprite_ext(spr_itemIcons, myColor, x + sprite_width - 80, y + sprite_height - 80, 2, 2, 0, #000000, 0.1);
		
		// Draw shadow text for item name
		draw_set_alpha(1);
		draw_set_color(#000000);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_sideName);

		tooWideCheck(myStruct.myName);

		draw_text_transformed(left, top, myStruct.myName, tooWideScale, tooWideScale, 0);
		
		// Item name
		draw_set_color(#FFFFFF);
		draw_text_transformed(left - 4, top - 4, myStruct.myName, tooWideScale, tooWideScale, 0);
		
		// Draw the amount of that item on hand
		draw_set_color(#000000);
		draw_set_halign(fa_right);
		draw_set_font(fnt_sideName);
		var countString = string(getItemCount(myStruct.myName));
		if (setQuantity != -1){
			countString = setQuantity;	
		}
		draw_text_transformed(right, top, countString, 1, 1, 0);
		draw_text_transformed(right - 90, top + 7, "X", 0.6, 0.6, 0);
		// Item count
		draw_set_color(#FFFFFF);
		if (!useable){
			draw_set_color(#999999);
		}
		draw_text_transformed(right - 4, top - 4,countString, 1, 1, 0);
		draw_text_transformed(right - 93, top + 4, "X", 0.6, 0.6, 0);
		
		// Draw item description shadow
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(#000000);
		draw_set_font(fnt_sideLevel);
		var descriptionString = myStruct.description;
		top += 45;
		left = x + sprite_width * 0.1;
		draw_text_ext( left, top, descriptionString, 50, sprite_width * 0.8);
		
		// description
		draw_set_color(#FFFFFF);
		draw_text_ext(left - 3, top - 3, descriptionString, 50, sprite_width * 0.8);
		
		break;
		
	case DROPS.key:
		
		// key color
		myColor = #ffec8f;
		
		// Draw background
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, myColor, 1);
		
		// Wait until intro over
		if (sprite_index == spr_descriptionBoxIntro) exit;
		
		// Draw item icon
		draw_sprite_ext(spr_keyIcon, 0, x + sprite_width - 80, y + sprite_height - 80, 2, 2, 0, #000000, 0.1);
		
		// Draw shadow text for item name
		draw_set_alpha(1);
		draw_set_color(#000000);
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(fnt_sideName);

		tooWideCheck(myStruct.myName);

		draw_text_transformed(left, top, myStruct.myName, tooWideScale, tooWideScale, 0);
		
		// Key name
		draw_set_color(#FFFFFF);
		draw_text_transformed(left - 4, top - 4, myStruct.myName, tooWideScale, tooWideScale, 0);
		
		// Draw the amount of that item on hand
		draw_set_color(#000000);
		draw_set_halign(fa_right);
		draw_set_font(fnt_sideName);
		var countString = "1";
		draw_text_transformed(right, top, countString, 1, 1, 0);
		draw_text_transformed(right - 90, top + 7, "X", 0.6, 0.6, 0);
		// Item count
		draw_set_color(#FFFFFF);
		draw_text_transformed(right - 4, top - 4,countString, 1, 1, 0);
		draw_text_transformed(right - 93, top + 4, "X", 0.6, 0.6, 0);
		
		// Draw item description shadow
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(#000000);
		draw_set_font(fnt_sideLevel);
		var descriptionString = myStruct.description;
		top += 45;
		left = x + sprite_width * 0.1;
		draw_text_ext( left, top, descriptionString, 50, sprite_width * 0.8);
		
		// description
		draw_set_color(#FFFFFF);
		draw_text_ext(left - 3, top - 3, descriptionString, 50, sprite_width * 0.8);
		
		break;
		
		
}