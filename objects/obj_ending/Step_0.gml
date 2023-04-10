/// @description Insert description here
// You can write your code in this editor
if (initialWait < 60){
	initialWait++;
	exit;
}

checkerboardOff = (checkerboardOff + 2) % 108;

switch (phase) {
	
	case 0:
		doorVel++;
		doorOff += doorVel;
		brightness -= 0.005;
		if (doorOff-100 > doorWidth){
			phase = 1;
		}
		break;
		
	case 1:
		thanksFade += 0.01;
		if (thanksFade > 1){
			thanksFade = 1;
			initialWait = 0;
			phase = 2;
		}
		break;
		
	case 2:
		thanksFade -= 0.01;
		if (thanksFade < 0){
			thanksFade = 0;
			phase = 3;
		}
		break;
		
	case 3:
		checkerHOff += -checkerHOff/10;
		if (checkerHOff > 0){
			checkerHOff = 0;	
		}
		break;
}