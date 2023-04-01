
// Draw background
if (drawMySprite) {
	draw_self();
	
	if (subjectSprite != pointer_null){
		draw_sprite(subjectSprite, 0, global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.65);
	}
}

// draw fade
draw_set_color(#000000);
draw_set_alpha( fadeTimer / maxFade );
draw_rectangle(x, y, global.dungeonPixelWidth, global.dungeonPixelHeight, false);	
draw_set_alpha(1);
