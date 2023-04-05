

// draw fade
draw_set_color(#000000);
draw_set_alpha( fadeTimer / maxFade );
draw_rectangle(x, y, global.dungeonPixelWidth, global.dungeonPixelHeight, false);	
draw_set_alpha(1);
