/// @description Insert description here
// You can write your code in this editor
if (!global.inBattle && y > 801){
	y = round(y-30)
}

if (global.inBattle && y < 1101){
	y = round(y+30)
}