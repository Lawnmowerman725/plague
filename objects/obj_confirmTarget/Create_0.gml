/// @description Insert description here
// You can write your code in this editor
// draws tool tips at the bottom
function drawToolTip(){
	
	var _arr = global.tips;
	var finalStr = "";
	for (var i = array_length(_arr) - 1; i >= 0; i--){
		finalStr += _arr[i];
		if (i != 0){
			finalStr  += "      ";	
		}
	}
	
	draw_set_color(#BBBBBB)
	draw_set_font(fnt_toolTip)
	draw_set_alpha(1)
	draw_set_halign(fa_right)
	draw_set_valign(fa_bottom)
	draw_text(global.dungeonPixelWidth - 8, global.dungeonPixelHeight - 6, finalStr)
}