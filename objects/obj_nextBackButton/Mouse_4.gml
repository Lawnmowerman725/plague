/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, id) && enabled) {
	if (backButton){
		with(obj_titleScreen){
			previousPage();	
		}
	}
	else {
		with(obj_titleScreen){
			nextPage();	
		}
	}
}