/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left)){
	if (mouse_x > left && mouse_x < right && mouse_y > top && mouse_y < bottom){
		obj_titleScreen.selectedClass = myIndex;	
	}
}