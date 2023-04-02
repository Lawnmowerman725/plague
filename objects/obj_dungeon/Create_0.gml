/// @description Insert description here
// You can write your code in this editor

window_set_size(1920, 1080);
//window_set_size(1280, 720)

updateVisuals();
playDungeonTheme();
turnShiftValues = [1, 2, 3, 4, 5, 6, -3, -2, -1, 0, 1, 2, -6, -5, -4, -3, -2, -1];

loadPalette(2);

function resetAfterEvent(){
	if (eventWall != WALL.locked) editForwardWall(0, PALETTE.doorClosed);
	eventWall = 0;
	eventTimer = 0;
	updateVisuals();
	global.inBattle = false;
}


//sprite_index = getWallSprite(PALETTE.background);


