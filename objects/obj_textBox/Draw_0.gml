/// @description Insert description here
// You can write your code in this editor

if (!usePulse) draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, #000000, 0.7);
else draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, make_color_hsv(0, 0, 123 * dsin(pulseTimer)+122), 0.7);

draw_set_color(#FFFFFF);
draw_set_font(fnt_battleBox);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
draw_text_ext(x, y, string(content), 48, 1060);


if (array_length(commands) > 0){
	
	draw_set_halign(fa_center);
	if (array_length((commands))>4){
		
		draw_set_font(fnt_normal);
	}
	for (var i = 0; i < array_length(commands); i++){
		draw_set_color(#FFFFFF);
		interval = 576/array_length(commands);
		offse = interval / 2;
		draw_text(x + 18 + offse + i * interval, y+50, string(commands[i][0]) + ":");
		draw_text(x + 18 + offse + i * interval, y+80, commands[i][1]);
		
		if(array_length(commands[i]) > 2){
			
			if (commands[i][2] > global.MP){
				draw_set_color(#777777);
			}
			draw_text(x + 18 + offse + i * interval, y+110, string(commands[i][2]) + " MP");
			
		}
	}
}








