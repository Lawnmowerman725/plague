/// @description Insert description here
// You can write your code in this editor
/*
wheelIcons = [spr_iconAttack, spr_iconSkill, spr_iconItem, spr_iconDefend, spr_iconAnalyze, spr_iconFlee];
wheelActions = ["Attack", "Flee","Analyze","Defend","Item","Skill"];
*/
wheelIcons = [spr_iconSkill, spr_iconItem, spr_iconDefend, spr_iconAnalyze, spr_iconFlee];
wheelActions = ["Flee","Analyze","Defend","Item","Action"];

wheelIndex = global.battleCursorMemory1;

if (instance_exists(obj_battle)){
	bossBattle = obj_battle.bossBattle;
}
/*
function drawWheelIcons(_index, _icons, _offset = 0){
	var myIndex = 0;
	var gap = 150;
	var mX = 0;
	var mY = 0;
	
	var _size = array_length(_icons);
	
	
	for (var i = 0; i < _size; i++){
		myIndex = (i + 3 + _index) % _size;
		mX = (myIndex - 2) * gap + _offset;
		mY = power(mX,2)/660 - 160 + global.dungeonPixelHeight;
		if (_offset == 0 && myIndex == 3){
			mY += 3*sin(arrowTimer / 10 * pi)
		}
		mX += 64;
		draw_sprite(_icons[i], 0, mX, mY)
	}
}*/

function drawWheelIcons(_index, _icons, _offset = 0){
	var myIndex = 0;
	var gaps = [150, 150, 150, 135, 150];
	var mX = 0;
	var mY = 0;
	var gap = 0;
	var myOff = 0;
	var _size = array_length(_icons);
	
	
	for (var i = 0; i < _size; i++){
		myIndex = (i + 3 + _index) % _size;
		gap = gaps[myIndex]
		myOff = _offset / 100 * gap;
		mX = (myIndex - 1) * gap + myOff;
		mY = power(mX,2)/660 - 160 + global.dungeonPixelHeight * 2/3;
		if (_offset == 0 && myIndex == 2){
			mY += 3*sin(arrowTimer / 10 * pi)
		}
		mX += 64;
		mX *= 1.5;
		mY *= 1.5;
		
		var drawCol = #FFFFFF;
		// Grey out invalid icons
		// Analyze or Item w/o items or flee during boss battle
		if (i == 3 || (i == 1 && !hasItems()) || (i == 4 && bossBattle) ){
			drawCol = #333333;
		}
		
		draw_sprite_ext(_icons[i], 0, mX, mY, 1, 1, 0, drawCol, 1);
	}
}