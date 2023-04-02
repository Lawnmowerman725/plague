
// Draw background
if (drawMySprite && battleStart <= 50) {
	draw_self();
	
	if (subjectSprite != pointer_null){
		draw_sprite(subjectSprite, 0, global.dungeonPixelWidth/2, global.dungeonPixelHeight*0.65);
	}
}

// Battle stuff
if (battleStart <= 50){
	draw_set_alpha(battleStart*0.02);
}
else {
	draw_set_alpha(1-(battleStart-50)*0.02);
}
draw_set_color(#000000);
draw_rectangle(0, 0, global.dungeonPixelWidth, global.dungeonPixelHeight, false);
draw_set_alpha(1);


// draw fade
draw_set_color(#000000);
draw_set_alpha( fadeTimer / maxFade );
draw_rectangle(x, y, global.dungeonPixelWidth, global.dungeonPixelHeight, false);	
draw_set_alpha(1);
