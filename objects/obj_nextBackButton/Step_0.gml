/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, id) && enabled) {
	myScale += 0.03;
	if (myScale > 1.2){
		myScale = 1.2;	
	}
}
else {
	myScale -= 0.03;
	if (myScale < 1){
		myScale = 1;	
	}
}