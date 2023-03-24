/// @description Insert description here
// You can write your code in this editor
if (global.idleTimer > 90){
	if (hiddenOff > 0){
		hiddenOff -= 6
		round(hiddenOff)
	}
}
else {
	if (hiddenOff < 300){
		hiddenOff += 10
		round(hiddenOff)
	}
}

if (hiddenOff < 0){
	hiddenOff = 0;
}