/// @description Insert description here
// You can write your code in this editor
x = global.dungeonPixelWidth/2 - sprite_width/2;
y = global.dungeonPixelHeight/2 - sprite_height/2;

midVal = irandom_range(0, 255);
sat = irandom_range(80, 200);
val = irandom_range(80, 200);

hueRange = irandom_range(5, 20);


myColor = make_color_hsv(midVal, sat, val);
movementType = irandom_range(0,3);

moveSpeed = random_range(1, 7);
originalSpeed = moveSpeed;

var backs = [spr_battleBack1, spr_battleBack2, spr_battleBack3, spr_battleBack4, spr_battleBack5];
sprite_index = backs[irandom_range(0, array_length(backs)-1)];