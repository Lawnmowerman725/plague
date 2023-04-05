/// @description Insert description here
// You can write your code in this editor
myColor = #FFFFFF;

switch (element) {
	case ELEMENTS.phys:
		myColor = #FFFFFF;
		break;
	case ELEMENTS.fire:
		myColor = #f53716;
		break;
	case ELEMENTS.water:
		myColor = #4674e0;
		break;
	case ELEMENTS.elec:
		myColor = #ffe159;
		break;
	case ELEMENTS.ground:
		myColor = #5c3c1f;
		break;
	case ELEMENTS.wind:
		myColor = #2de373;
		break;
	case ELEMENTS.forbid:
		myColor = #444444;
		break;
	case ELEMENTS.holy:
		myColor = #FFFFFF;
		break;
	default:
		myColor = #FFFFFF;
		break;	
}

if (fromEnemy){
	draw_sprite_ext(sprite_index, image_index, x, y, -3.6, 3.6, 0, myColor, 1);
}
else {
	draw_sprite_ext(sprite_index, image_index, x, y, 2, 2, 0, myColor, 1);
}
